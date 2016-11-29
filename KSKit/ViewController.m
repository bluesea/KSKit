//
//  ViewController.m
//  KSKit
//
//  Created by pingyandong on 2016/11/28.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "ViewController.h"
#import "KSShare.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(100, 100, 100, 100);
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testShare) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testShare
{
    NSArray *contentArray = @[@{@"name":@"新浪微博",@"icon":@"sns_icon_3",@"platformType":@"sina"},
                              @{@"name":@"QQ空间 ",@"icon":@"sns_icon_5",@"platformType":@"qzone"},
                              @{@"name":@"QQ",@"icon":@"sns_icon_4",@"platformType":@"qq"},
                              @{@"name":@"微信",@"icon":@"sns_icon_7",@"platformType":@"wechatsession"},
                              @{@"name":@"朋友圈",@"icon":@"sns_icon_8",@"platformType":@"wechattimeline"}];
    KSShareMenuView *shareView = [[KSShareMenuView alloc] init];
    shareView.rowNumberItem=3;
    shareView.cancelButtonText=@"取消分享";
    [shareView addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title, NSString *platformType) {
        NSLog(@"%ld --- %@,type--- %@", tag, title,platformType);
        [KSShareHelper shareTextDataWithPlatform:[KSShareTool getPlatformType:platformType] withTextData:@"test kit" withCompletion:^(id result, NSError *error) {

        }];
    }];
}
@end
