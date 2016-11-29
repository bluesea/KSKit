//
//  KSShareTool.h
//  KSKit
//
//  Created by pingyandong on 2016/11/29.
//  Copyright © 2016年 Kingsum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>
#import "KSShareConfigManager.h"

@interface KSShareTool : NSObject

+ (UMSocialPlatformType)getUMSocialPlatformKSPlatformType:(KSSocialPlatformType)ksPlatformType;

+ (KSSocialPlatformType)getPlatformType:(NSString *)platformType;

@end
