//
//  KSShareHelper.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSShareConfigManager.h"

/**
 *  授权，分享，UserProfile等操作的回调
 *
 *  @param result 代表回调的结果
 *  @param error  代表回调的错误码
 */
typedef void (^KSSocialShareCompletionHandler)(id result,NSError *error);

@interface KSShareHelper : NSObject
@property (nonatomic, copy) KSSocialShareCompletionHandler shareCompletionBlock;

/**
 纯文本分享
 @param platformType 平台类型
 @param textData     分享内容
 */
+ (void)shareTextDataWithPlatform:(KSSocialPlatformType)platformType withTextData:(NSString *)textData withCompletion:(KSSocialShareCompletionHandler)completionHandler;


/**
 URL分享
 
 @param platformType      平台类型
 @param shareUrl          分享的URL
 @param title             标题
 @param descr             简介
 @param thumImage         缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)shareUrlDataWithPlatform:(KSSocialPlatformType)platformType withShareUrl:(NSString *)shareUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler;


/**
 图文分享
 
 @param platformType      平台类型
 @param shareImage        分享的图片（可以是UIImage类对象，也可以是NSdata类对象，也可以是图片链接imageUrl NSString类对象）图片大小根据各个平台限制而定
 @param title             标题
 @param descr             简介
 @param thumImage         缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)shareImageTextDataWithPlatform:(KSSocialPlatformType)platformType withShareImage:(id)shareImage withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler;



/**
 视频网页分享
 
 @param platformType      平台类型
 @param shareVideoUrl     视频网页的URL字符串 不能为空且长度不能超过255
 @param title             标题
 @param descr             简介
 @param thumImage         缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)shareVideoDataWithPlatform:(KSSocialPlatformType)platformType withShareVideoUrl:(NSString *)shareVideoUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler;


/**
 视频网页分享
 
 @param platformType      平台类型
 @param shareMusicUrl 音乐网页的url地址  长度不能超过10K
 @param title             标题
 @param descr             简介
 @param thumImage         缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)shareMusicDataWithPlatform:(KSSocialPlatformType)platformType withShareMusicUrl:(NSString *)shareMusicUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler;

@end
