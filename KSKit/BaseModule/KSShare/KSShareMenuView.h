//
//  KSShareMenuView.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectItemBlock)(NSInteger tag, NSString *title);


@interface KSShareMenuView : UIView
//一行有几个
@property(nonatomic)NSInteger rowNumberItem;

//菜单文字设置
@property(nonatomic,strong)UIFont *shareItemButtonFont;
@property(nonatomic,strong)UIColor *shareItemButtonColor;

//底部取消相关设置
@property(nonatomic,strong)UIColor *cancelBackgroundColor;
@property(nonatomic,copy)NSString *cancelButtonText;
@property(nonatomic,strong)UIFont *cancelButtonFont;
@property(nonatomic,strong)UIColor *cancelButtonColor;

/**
 *  弹出分享
 *
 *  @param superView       父视图
 *  @param shareItems      QQ/WeChat/Weibo
 *  @param selectShareItem 点击回调
 */
- (void)addShareItems:(UIView *)superView  shareItems:(NSArray *)shareItems selectShareItem:(selectItemBlock)selectShareItem;

@end
