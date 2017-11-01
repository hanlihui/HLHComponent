//
//  UIDevice+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

@interface UIDevice (HLHExtend)

/**
 @return Device system version (e.g. 8.1)
 */
+ (float)systemVersion;

@property (nonatomic, readonly) BOOL isPad;         ///< Whether the device is iPad/iPad mini.


@end
