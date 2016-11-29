//
//  KSShareModule.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSShareModule.h"
#import <UMSocialCore/UMSocialCore.h>
#import "KSShareConfigManager.h"

@implementation KSShareModule
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
    //友盟分享
    KSShareConfigManager *KSShareConfig=[KSShareConfigManager sharedInstance];
    KSShareConfig.shareAppKey=@"512a1f5d527015226c00005d";
    KSShareConfig.shareLogEnabled=NO;
    //设置平台
    [KSShareConfig setPlaform:KSSocialPlatConfigType_Tencent appKey:@"100424468" appSecret:@"c7394704798a158208a74ab60104f0ba" redirectURL:@"http://www.umeng.com/social"];
    [KSShareConfig setPlaform:KSSocialPlatConfigType_Wechat appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://www.umeng.com/social"];
    [KSShareConfig setPlaform:KSSocialPlatConfigType_Sina appKey:@"3921700954" appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"http://sns.whalecloud.com/sina2/callback"];

    
    //打开日志
    if (KSShareConfigManagerInstance.isLogEnabled) {
        [[UMSocialManager defaultManager]
#if DEBUG
         openLog:YES];
#endif
    }
    
    //设置Key
    NSAssert(KSShareConfigManagerInstance.shareAppKey, @"umeng分享的key不能为空");
    if (KSShareConfigManagerInstance.shareAppKey) {
        //设置友盟appkey
        [[UMSocialManager defaultManager] setUmSocialAppkey:KSShareConfigManagerInstance.shareAppKey];
    }
    //各平台的详细配置
    if(KSShareConfigManagerInstance.KSSocialPlatConfigType_Wechat_AppKey&&KSShareConfigManagerInstance.KSSocialPlatConfigType_Wechat_AppSecret)
    {
        NSLog(@"分享-微信平台已经配置");
        //设置微信的appId和appKey
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:KSShareConfigManagerInstance.KSSocialPlatConfigType_Wechat_AppKey appSecret:KSShareConfigManagerInstance.KSSocialPlatConfigType_Wechat_AppSecret redirectURL:KSShareConfigManagerInstance.KSSocialPlatConfigType_Wechat_RedirectURL];
    }
    
    if(KSShareConfigManagerInstance.KSSocialPlatConfigType_Tencent_AppKey&&KSShareConfigManagerInstance.KSSocialPlatConfigType_Tencent_AppSecret)
    {
        NSLog(@"分享-腾讯平台已经配置");
        //设置分享到QQ互联的appId和appKey
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:KSShareConfigManagerInstance.KSSocialPlatConfigType_Tencent_AppKey  appSecret:KSShareConfigManagerInstance.KSSocialPlatConfigType_Tencent_AppSecret redirectURL:KSShareConfigManagerInstance.KSSocialPlatConfigType_Tencent_RedirectURL];
    }
    
    if(KSShareConfigManagerInstance.KSSocialPlatConfigType_Sina_AppKey&&KSShareConfigManagerInstance.KSSocialPlatConfigType_Sina_AppSecret)
    {
        NSLog(@"分享-新浪平台已经配置");
        //设置新浪的appId和appKey
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:KSShareConfigManagerInstance.KSSocialPlatConfigType_Sina_AppKey  appSecret:KSShareConfigManagerInstance.KSSocialPlatConfigType_Sina_AppSecret redirectURL:KSShareConfigManagerInstance.KSSocialPlatConfigType_Sina_RedirectURL];
    }

    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
}



#pragma mark - scheme url
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}
@end
