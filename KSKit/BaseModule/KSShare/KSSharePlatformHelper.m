//
//  KSSharePlatformHelper.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSSharePlatformHelper.h"
#import <UMSocialCore/UMSocialCore.h>
#import "KSShareTool.h"

@implementation KSSharePlatformHelper
+(BOOL)installPlatAppWithType:(KSSocialPlatformType)platformType
{
    BOOL result=NO;
    
    result=[[UMSocialManager defaultManager] isInstall:[KSShareTool getUMSocialPlatformKSPlatformType:platformType]];
    
    return result;
}


/**
 授权
 
 @param platformType 平台类型
 */
+(void)authWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSSocialAuthCompletionHandler)completionHandler
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:[KSShareTool getUMSocialPlatformKSPlatformType:platformType] currentViewController:nil completion:^(id result, NSError *error) {
        UMSocialAuthResponse *authresponse=result;
        completionHandler(authresponse.uid,authresponse.openid,authresponse.accessToken,error);
    }];
}


/**
 取消授权
 
 @param platformType 平台类型
 */
+(void)cancelAuthWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSCancelSocialAuthCompletionHandler)completionHandler
{
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:[KSShareTool getUMSocialPlatformKSPlatformType:platformType] completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}


/**
 获得用户信息
 
 @param platformType 平台类型
 */
+(void)getUserInfoWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSSocialGetUserInfoCompletionHandler)completionHandler
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:[KSShareTool getUMSocialPlatformKSPlatformType:platformType] currentViewController:nil completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userinfo =result;
        completionHandler(userinfo.name,userinfo.iconurl,userinfo.gender,error);
    }];
}


@end
