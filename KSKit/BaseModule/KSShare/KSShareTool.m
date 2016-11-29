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
@end
