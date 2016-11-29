//
//  KSShareTool.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSShareTool.h"

@implementation KSShareTool
+ (UMSocialPlatformType)getUMSocialPlatformKSPlatformType:(KSSocialPlatformType)ksPlatformType
{
    UMSocialPlatformType platFormType=UMSocialPlatformType_UnKnown;
    switch (ksPlatformType) {
        case KSSocialPlatformType_QQ:
            platFormType=UMSocialPlatformType_QQ;
            break;
        case KSSocialPlatformType_Sina:
            platFormType=UMSocialPlatformType_Sina;
            break;
        case KSSocialPlatformType_Qzone:
            platFormType=UMSocialPlatformType_Qzone;
            break;
        case KSSocialPlatformType_TencentWb:
            platFormType=UMSocialPlatformType_TencentWb;
            break;
        case KSSocialPlatformType_WechatSession:
            platFormType=UMSocialPlatformType_WechatSession;
            break;
        case KSSocialPlatformType_WechatTimeLine:
            platFormType=UMSocialPlatformType_WechatTimeLine;
            break;
        default:
            platFormType=UMSocialPlatformType_UnKnown;
            break;
    }
    
    return platFormType;
}

/**
 转换类型
 
 @param platformType 平台字符串sina（新浪微博）wechatsession（微信好友）wechattimeline（微信朋友圈）tencentwb（腾讯微博）qzone(QQ空间) qq（QQ）
 
 @return KS平台类型
 */
+ (KSSocialPlatformType)getPlatformType:(NSString *)platformType
{
    KSSocialPlatformType ksPlatformType=KSSocialPlatformType__UnKnown;
    if ([platformType isEqualToString:@"sina"]) {
        ksPlatformType=KSSocialPlatformType_Sina;
    }
    else if ([platformType isEqualToString:@"wechatsession"])
    {
        ksPlatformType=KSSocialPlatformType_WechatSession;
    }
    else if ([platformType isEqualToString:@"tencentwb"])
    {
        ksPlatformType=KSSocialPlatformType_TencentWb;
    }
    else if ([platformType isEqualToString:@"wechattimeline"])
    {
        ksPlatformType=KSSocialPlatformType_WechatTimeLine;
    }
    else if ([platformType isEqualToString:@"qzone"])
    {
        ksPlatformType=KSSocialPlatformType_Qzone;
    }
    else if ([platformType isEqualToString:@"qq"])
    {
        ksPlatformType=KSSocialPlatformType_QQ;
    }
    else
    {
        NSLog(@"分享指定的类型不存在，请检查平台类型字符串是否正确");
    }
    return ksPlatformType;
}

@end
