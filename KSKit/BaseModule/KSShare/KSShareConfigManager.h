//
//  KSShareConfigManager.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KSShareConfigManagerInstance [KSShareConfigManager sharedInstance]

//配置类型 目前只支持新浪、微信、腾讯
typedef NS_ENUM(NSInteger,KSSocialPlatConfigType)
{
    KSSocialPlatConfigType_Sina,        //新浪
    KSSocialPlatConfigType_Wechat,      //微信
    KSSocialPlatConfigType_Tencent,     //腾讯
};


//平台类型 目前只支持新浪、微信聊天、微信朋友圈、QQ聊天页面、qq空间、腾讯微博
typedef NS_ENUM(NSInteger,KSSocialPlatformType)
{
    KSSocialPlatformType__UnKnown,      //未指定
    KSSocialPlatformType_Sina,          //新浪
    KSSocialPlatformType_WechatSession, //微信聊天
    KSSocialPlatformType_WechatTimeLine,//微信朋友圈
    KSSocialPlatformType_QQ,            //QQ聊天页面
    KSSocialPlatformType_Qzone,         //qq空间
    KSSocialPlatformType_TencentWb,     //腾讯微博
};

@interface KSShareConfigManager : NSObject
//友盟分享配置 友盟key,是否开启SDK调试
@property (strong, nonatomic) NSString *shareAppKey;
@property (nonatomic,getter=isLogEnabled) BOOL shareLogEnabled;

//其它配置 分享成功跟失败的提示语
@property (strong, nonatomic) NSString *shareSuccessMessage;
@property (strong, nonatomic) NSString *shareFailMessage;

//设置新浪
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Sina_AppKey;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Sina_AppSecret;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Sina_RedirectURL;

//设置微信
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Wechat_AppKey;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Wechat_AppSecret;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Wechat_RedirectURL;

//设置腾讯
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Tencent_AppKey;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Tencent_AppSecret;
@property (strong, nonatomic) NSString *KSSocialPlatConfigType_Tencent_RedirectURL;

+ (KSShareConfigManager *)sharedInstance;

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
       redirectURL:(NSString *)redirectURL;

@end
