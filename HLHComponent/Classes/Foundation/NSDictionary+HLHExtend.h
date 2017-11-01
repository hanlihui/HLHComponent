//
//  NSDictionary+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HLHExtend)

/**
 Convert dictionary to json string. return nil if an error occurs.
 */
- (NSString *)jsonString;

@end
