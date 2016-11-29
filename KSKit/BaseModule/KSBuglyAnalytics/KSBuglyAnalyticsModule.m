//
//  KSBuglyAnalyticsModule.m
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSBuglyAnalyticsModule.h"
#import <BuglyHotfix/Bugly.h>

#define kBuglyAppId @"f01951e723"
@implementation KSBuglyAnalyticsModule
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@  Timeline", NSStringFromSelector(_cmd));
    //Bugly统计、热更新功能
    BuglyConfig *buglyConfig = [[BuglyConfig alloc] init];
    buglyConfig.hotfixDebugMode = YES;
    [Bugly startWithAppId:kBuglyAppId
#ifdef DEBUG
        developmentDevice:YES
#endif
                   config:buglyConfig];
    
    return YES;
}

@end
