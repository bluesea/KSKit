//
//  KSWebShareHelper.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol KSWebShareHelperDelegate <JSExport>

/**
 纯文本分享
 
 @param platformType sina（新浪微博）wechatsession（微信好友）wechattimeline（微信朋友圈）tencentwb（腾讯微博）qzone(QQ空间) qq（QQ）
 @param text         文本内容
 */
JSExportAs(shareText,-(void)shareText:(NSString *)platformType withText:(NSString *)text);


/**
 URL分享
 
 @param platformType sina（新浪微博）wechatsession（微信好友）wechattimeline（微信朋友圈）tencentwb（腾讯微博）qzone(QQ空间) qq（QQ）
 @param shareUrl     分享地址URL
 @param title        标题
 @param descr        简介
 @param thumImageUrl 缩略图URL
 */
JSExportAs(shareUrl,-(void)shareUrl:(NSString *)platformType withShareUrl:(NSString *)shareUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImageUrl:(NSString *)thumImageUrl);


/**
 图文分享
 
 @param platformType  sina（新浪微博）wechatsession（微信好友）wechattimeline（微信朋友圈）tencentwb（腾讯微博）qzone(QQ空间) qq（QQ）
 @param shareImageUrl 分享图片的URL
 @param title         标题
 @param descr         简介
 @param thumImageUrl  缩略图URL
 */
JSExportAs(shareImageText,- (void)shareImageText:(NSString *)platformType withShareImageUrl:(NSString *)shareImageUrl withTitle:(NSString *)title withDescr:(NSString *)descr withThumImageUrl:(NSString *)thumImageUrl);

@end



@interface KSWebShareHelper : NSObject<KSWebShareHelperDelegate>
@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, weak) UIWebView *webView;

@end
