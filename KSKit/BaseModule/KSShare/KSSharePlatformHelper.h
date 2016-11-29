//
//  KSSharePlatformHelper.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSShareConfigManager.h"

/**
 授权
 
 @param uid         授权成功获得uid
 @param openid      授权成功获得openid QQ，微信用户openid，其他平台没有
 @param accessToken 授权成功获得accessToken
 @param error       error
 */
typedef void (^KSSocialAuthCompletionHandler)(NSString *uid,NSString *openid,NSString *accessToken,NSError *error);


/**
 取消授权
 
 @param result 结果
 @param error  error
 */
typedef void (^KSCancelSocialAuthCompletionHandler)(id result,NSError *error);


/**
 获得用户
 
 @param name    用户名称
 @param iconUrl 头像URL
 @param gender  性别 （m表示男，w表示女）
 @param error   error
 */
typedef void (^KSSocialGetUserInfoCompletionHandler)(NSString *name,NSString *iconUrl,NSString *gender,NSError *error);


@interface KSSharePlatformHelper : NSObject
@property (nonatomic, copy) KSSocialAuthCompletionHandler socialAuthCompletionBlock;
@property (nonatomic, copy) KSCancelSocialAuthCompletionHandler cancelSocialAuthCompletionBlock;
@property (nonatomic, copy) KSSocialGetUserInfoCompletionHandler socialGetUserInfoCompletionBlock;

/**
 判断当前手机是否有安装相应的APP
 
 @param platformType 平台类型
 
 @return YES 有安装 NO 未安装
 */
+(BOOL)installPlatAppWithType:(KSSocialPlatformType)platformType;


/**
 授权
 
 @param platformType 平台类型
 */
+(void)authWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSSocialAuthCompletionHandler)completionHandler;


/**
 取消授权
 
 @param platformType 平台类型
 */
+(void)cancelAuthWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSCancelSocialAuthCompletionHandler)completionHandler;


/**
 获得用户信息
 
 @param platformType 平台类型
 */
+(void)getUserInfoWithPlatform:(KSSocialPlatformType)platformType withCompletion:(KSSocialGetUserInfoCompletionHandler)completionHandler;


@end
