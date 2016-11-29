//
//  KSWebShareHelper.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSWebShareHelper.h"
#import "KSShareHelper.h"
#import "KSShareConfigManager.h"
#import "KSShareTool.h"
@implementation KSWebShareHelper
-(void)shareText:(NSString *)platformType withText:(NSString *)text
{
    //要在主线程进行
    dispatch_async(dispatch_get_main_queue(), ^{
        [KSShareHelper shareTextDataWithPlatform:[KSShareTool getPlatformType:platformType] withTextData:text withCompletion:^(id result, NSError *error) {
            [self shareResultShow:error];
        }];
    });
}

-(void)shareUrl:(NSString *)platformType withShareUrl:(NSString *)shareUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImageUrl:(NSString *)thumImageUrl
{
    //要在主线程进行
    dispatch_async(dispatch_get_main_queue(), ^{
        [KSShareHelper shareUrlDataWithPlatform:[KSShareTool getPlatformType:platformType] withShareUrl:shareUrl withTitle:title withDescr:descr withThumImage:thumImageUrl withCompletion:^(id result, NSError *error) {
            [self shareResultShow:error];
        }];
    });
}

- (void)shareImageText:(NSString *)platformType withShareImageUrl:(NSString *)shareImageUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImageUrl:(NSString *)thumImageUrl
{
    //要在主线程进行
    dispatch_async(dispatch_get_main_queue(), ^{
        [KSShareHelper shareImageTextDataWithPlatform:[KSShareTool getPlatformType:platformType] withShareImage:shareImageUrl withTitle:title withDescr:descr withThumImage:thumImageUrl withCompletion:^(id result, NSError *error) {
            [self shareResultShow:error];
        }];
    });
}

///**
// 转换类型
// 
// @param platformType 平台字符串sina（新浪微博）wechatsession（微信好友）wechattimeline（微信朋友圈）tencentwb（腾讯微博）qzone(QQ空间) qq（QQ）
// 
// @return KS平台类型
// */
//-(KSSocialPlatformType)getPlatformType:(NSString *)platformType
//{
//    KSSocialPlatformType ksPlatformType=KSSocialPlatformType__UnKnown;
//    if ([platformType isEqualToString:@"sina"]) {
//        ksPlatformType=KSSocialPlatformType_Sina;
//    }
//    else if ([platformType isEqualToString:@"wechatsession"])
//    {
//        ksPlatformType=KSSocialPlatformType_WechatSession;
//    }
//    else if ([platformType isEqualToString:@"tencentwb"])
//    {
//        ksPlatformType=KSSocialPlatformType_TencentWb;
//    }
//    else if ([platformType isEqualToString:@"wechattimeline"])
//    {
//        ksPlatformType=KSSocialPlatformType_WechatTimeLine;
//    }
//    else if ([platformType isEqualToString:@"qzone"])
//    {
//        ksPlatformType=KSSocialPlatformType_Qzone;
//    }
//    else if ([platformType isEqualToString:@"qq"])
//    {
//        ksPlatformType=KSSocialPlatformType_QQ;
//    }
//    else
//    {
//        NSLog(@"分享指定的类型不存在，请检查平台类型字符串是否正确");
//    }
//    return ksPlatformType;
//}

-(void)shareResultShow:(NSError *)error
{
    if(error)
    {
        NSLog(@"分享失败了");
        return;
    }
    NSString *alertMessage=KSShareConfigManagerInstance.shareSuccessMessage?:@"分享成功";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:alertMessage delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}

@end
