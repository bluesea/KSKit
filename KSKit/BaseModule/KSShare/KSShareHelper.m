//
//  KSShareHelper.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSShareHelper.h"
#import <UMSocialCore/UMSocialCore.h>
#import "KSShareTool.h"


@implementation KSShareHelper
+ (void)shareTextDataWithPlatform:(KSSocialPlatformType)platformType withTextData:(NSString *)textData withCompletion:(KSSocialShareCompletionHandler)completionHandler
{
    UMSocialPlatformType umPlatFormType=[KSShareTool getUMSocialPlatformKSPlatformType:platformType];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.text=textData;
    
    //友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}

+ (void)shareUrlDataWithPlatform:(KSSocialPlatformType)platformType withShareUrl:(NSString *)shareUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler
{
    UMSocialPlatformType umPlatFormType=[KSShareTool getUMSocialPlatformKSPlatformType:platformType];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    [shareObject setWebpageUrl:shareUrl];
    messageObject.shareObject = shareObject;
    
    //友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}

+ (void)shareImageTextDataWithPlatform:(KSSocialPlatformType)platformType withShareImage:(id)shareImage withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler
{
    UMSocialPlatformType umPlatFormType=[KSShareTool getUMSocialPlatformKSPlatformType:platformType];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    [shareObject setShareImage:shareImage];
    messageObject.shareObject = shareObject;
    
    //友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}

+ (void)shareVideoDataWithPlatform:(KSSocialPlatformType)platformType withShareVideoUrl:(NSString *)shareVideoUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler
{
    UMSocialPlatformType umPlatFormType=[KSShareTool getUMSocialPlatformKSPlatformType:platformType];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    [shareObject setVideoUrl:shareVideoUrl];
    messageObject.shareObject = shareObject;
    
    //友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}

+ (void)shareMusicDataWithPlatform:(KSSocialPlatformType)platformType withShareMusicUrl:(NSString *)shareMusicUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImage:(id)thumImage withCompletion:(KSSocialShareCompletionHandler)completionHandler
{
    UMSocialPlatformType umPlatFormType=[KSShareTool getUMSocialPlatformKSPlatformType:platformType];
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    [shareObject setMusicUrl:shareMusicUrl];
    messageObject.shareObject = shareObject;
    
    //友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result,error);
    }];
}

@end
