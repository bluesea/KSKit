//
//  KSShareConfigManager.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSShareConfigManager.h"

@implementation KSShareConfigManager

+ (KSShareConfigManager *)sharedInstance
{
    static KSShareConfigManager* instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[KSShareConfigManager alloc] init];
    });
    return instance;
}

/**
 设置平台配置内容
 
 @param platformType 平台类型
 @param appKey       appKey
 @param appSecret    appSecret
 @param redirectURL  redirectURL
 */
- (void)setPlaform:(KSSocialPlatConfigType)platformType
            appKey:(NSString *)appKey
         appSecret:(NSString *)appSecret
       redirectURL:(NSString *)redirectURL
{
    switch (platformType) {
        case KSSocialPlatConfigType_Sina:
            self.KSSocialPlatConfigType_Sina_AppKey=appKey;
            self.KSSocialPlatConfigType_Sina_AppSecret=appSecret;
            self.KSSocialPlatConfigType_Sina_RedirectURL=redirectURL;
            break;
        case KSSocialPlatConfigType_Wechat:
            self.KSSocialPlatConfigType_Wechat_AppKey=appKey;
            self.KSSocialPlatConfigType_Wechat_AppSecret=appSecret;
            self.KSSocialPlatConfigType_Wechat_RedirectURL=redirectURL;
            break;
        case KSSocialPlatConfigType_Tencent:
            self.KSSocialPlatConfigType_Tencent_AppKey=appKey;
            self.KSSocialPlatConfigType_Tencent_AppSecret=appSecret;
            self.KSSocialPlatConfigType_Tencent_RedirectURL=redirectURL;
            break;
        default:
            break;
    }
}

@end
