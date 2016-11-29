//
//  KSAppDelegateManager.h
//  KSKit
//
//  Created by pingyandong on 2016/11/28.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif

@import UIKit;

@protocol KSAppDelegateManagerDelegate <UIApplicationDelegate,UNUserNotificationCenterDelegate>

@end

@interface KSAppDelegateManager : NSObject<UIApplicationDelegate,UNUserNotificationCenterDelegate>
+ (instancetype)sharedInstance;

- (void)loadModulesWithPlistFile:(NSString *)plistFile;

- (NSArray<id<KSAppDelegateManagerDelegate>> *)allModules;
@end
