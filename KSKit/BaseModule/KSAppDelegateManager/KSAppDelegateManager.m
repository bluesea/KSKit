//
//  KSAppDelegateManager.m
//  KSKit
//
//  Created by pingyandong on 2016/11/28.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import "KSAppDelegateManager.h"


@interface KSAppDelegateManager ()
@property (nonatomic, strong) NSMutableArray<id<KSAppDelegateManagerDelegate>> *modules;

@end

@implementation KSAppDelegateManager
+ (instancetype)sharedInstance
{
    static KSAppDelegateManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (NSMutableArray<id<KSAppDelegateManagerDelegate>> *)modules
{
    if (!_modules) {
        _modules = [NSMutableArray array];
    }
    return _modules;
}

- (void)addModule:(id<KSAppDelegateManagerDelegate>) module
{
    if (![self.modules containsObject:module]) {
        [self.modules addObject:module];
    }
}


- (void)loadModulesWithPlistFile:(NSString *)plistFile
{
    NSArray<NSString *> *moduleNames = [NSArray arrayWithContentsOfFile:plistFile];
    for (NSString *moduleName in moduleNames) {
        id<KSAppDelegateManagerDelegate> module = [[NSClassFromString(moduleName) alloc] init];
        [self addModule:module];
    }
}

- (NSArray<id<KSAppDelegateManagerDelegate>> *)allModules
{
    return self.modules;
}

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillTerminate:application];
        }
    }
}

/** 已登记用户通知 */
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    // 注册远程通知（推送）
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo];
        }
    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application performFetchWithCompletionHandler:completionHandler];
        }
    }
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
//  iOS 10: App在前台获取到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler]; 
        }
    }
}
//  iOS 10: 点击通知进入App时触发，在该方法内统计有效用户点击数
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];

        }
    }
}

#endif
#pragma mark - scheme url
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    for (id<KSAppDelegateManagerDelegate> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            return [module application:application handleOpenURL:url];
        }
    }
    return NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation{
    return NO;
}

@end
