//
//  RongCloudModule.m
//  KSKit
//
//  Created by pingyandong on 2016/11/30.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "RongCloudModule.h"
#import <RongIMKit/RongIMKit.h>
#import <AudioToolbox/AudioToolbox.h>

#if DEBUG
#define RongCloudAppKey @"pkfcgjstfltg8"
#else
#define RongCloudAppKey @"pkfcgjstfltg8"
#endif

@interface RongCloudModule ()<RCIMConnectionStatusDelegate,RCIMReceiveMessageDelegate>

@end

@implementation RongCloudModule
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"融云%@  Timeline", NSStringFromSelector(_cmd));
    [[RCIM sharedRCIM] initWithAppKey:RongCloudAppKey];
    //设置会话列表头像和会话界面头像
    
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    //开启用户信息和群组信息的持久化
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;
    
    //开启输入状态监听
    [RCIM sharedRCIM].enableTypingStatus=YES;
    //开启发送已读回执（只支持单聊）
    //    [RCIM sharedRCIM].enableReadReceipt=YES;
    //开启发送已读回执
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList = @[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION),@(ConversationType_GROUP)];
    
    [[RCIMClient sharedRCIMClient] recordLaunchOptionsEvent:launchOptions];
    [RCIM sharedRCIM].receiveMessageDelegate=self;
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(didReceiveMessageNotification:)
     name:RCKitDispatchMessageNotification
     object:nil];
    //设置用户信息源和群组信息源
//    [RCIM sharedRCIM].userInfoDataSource = LXChatDataSource;
//    [RCIM sharedRCIM].groupInfoDataSource = LXChatDataSource;
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [NSString stringWithFormat:@"%@", deviceToken];
    //获取终端设备标识，这个标识需要通过接口发送到服务器端，服务器端推送消息到APNS时需要知道终端的标识，APNS通过注册的终端标识找到终端设备。
    while (true) {
        NSString* last=token;
        token=[token stringByReplacingOccurrencesOfString:@"<" withString:@""];
        if ([token isEqual:last]) {
            break;
        }
    }
    while (true) {
        NSString* last=token;
        token=[token stringByReplacingOccurrencesOfString:@">" withString:@""];
        if ([token isEqual:last]) {
            break;
        }
    }
    while (true) {
        NSString* last=token;
        token=[token stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([token isEqual:last]) {
            break;
        }
    }
    NSLog(@"pushid %@",token);
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
    
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    /**
     * 统计推送打开率2
     */
    [[RCIMClient sharedRCIMClient] recordRemoteNotificationEvent:userInfo];
    /**
     * 获取融云推送服务扩展字段2
     */
    NSDictionary *pushServiceData = [[RCIMClient sharedRCIMClient] getPushExtraFromRemoteNotification:userInfo];
    if (pushServiceData) {
        NSLog(@"该远程推送包含来自融云的推送服务");
        for (id key in [pushServiceData allKeys]) {
            NSLog(@"key = %@, value = %@", key, pushServiceData[key]);
        }
        [self dealWithRongCloudIM:pushServiceData];
    }
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    /**
     * 统计推送打开率3
     */
    [[RCIMClient sharedRCIMClient] recordLocalNotificationEvent:notification];
    [self dealWithRongCloudIM:[notification userInfo]];
    //震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSound(1007);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                         @(ConversationType_PRIVATE),
                                                                         @(ConversationType_DISCUSSION),
                                                                         @(ConversationType_APPSERVICE),
                                                                         @(ConversationType_PUBLICSERVICE),
                                                                         @(ConversationType_GROUP)
                                                                         ]];
    application.applicationIconBadgeNumber = unreadMsgCount;
    
}

- (void)didReceiveMessageNotification:(NSNotification *)notification {
    NSNumber *left = [notification.userInfo objectForKey:@"left"];
    if ([RCIMClient sharedRCIMClient].sdkRunningMode ==
        RCSDKRunningMode_Backgroud &&
        0 == left.integerValue) {
        int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                             @(ConversationType_PRIVATE),
                                                                             @(ConversationType_DISCUSSION),
                                                                             @(ConversationType_APPSERVICE),
                                                                             @(ConversationType_PUBLICSERVICE),
                                                                             @(ConversationType_GROUP)
                                                                             ]];
        [UIApplication sharedApplication].applicationIconBadgeNumber =
        unreadMsgCount;
    }
}

#pragma mark - RCIMConnectionStatusDelegate

/**
 *  网络状态变化。
 *
 *  @param status 网络状态。
 */
- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"提示"
                              message:@"您"
                              @"的帐号在别的设备上登录，您被迫下线！"
                              delegate:nil
                              cancelButtonTitle:@"知道了"
                              otherButtonTitles:nil, nil];
        [alert show];
    } else if (status == ConnectionStatus_TOKEN_INCORRECT) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView =
            [[UIAlertView alloc] initWithTitle:nil
                                       message:@"Token已过期，请重新登录"
                                      delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil, nil];
            [alertView show];
        });
    }
}

-(void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left
{
    if ([message.content isMemberOfClass:[RCInformationNotificationMessage class]]) {
        RCInformationNotificationMessage *msg=(RCInformationNotificationMessage *)message.content;
        //NSString *str = [NSString stringWithFormat:@"%@",msg.message];
        if ([msg.message rangeOfString:@"你已添加了"].location!=NSNotFound) {
            
        }
    }else {
        [self updateBadge];
    }
}

- (void)updateBadge
{
    
}

#pragma mark - 处理融云推送消息
- (void)dealWithRongCloudIM:(NSDictionary *)pushServiceData
{
    
}
@end
