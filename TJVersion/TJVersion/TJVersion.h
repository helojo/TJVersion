//
//  TJVersion.h
//  TJVersion
//
//  Created by 谭杰 on 2016/12/14.
//  Copyright © 2016年 谭杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TJAppInfo.h"

typedef void(^NewVersionBlock)(TJAppInfo *appInfo);

@interface TJVersion : NSObject

/**
 *  检测新版本(使用默认提示框)
 */
+ (void)checkNewVersion;


/**
 *  检查新版本(自定义提醒)
 *
 *  @param newVersion 新版本信息回调
 */
+ (void)checkNewVersionAndCustomAlert:(NewVersionBlock)newVersion;

/**
 *  在应用内打开下载页面
 *  @param appId 应用id
 */
+ (void)openInStoreProductViewControllerForAppId:(NSString *)appId;

@end
