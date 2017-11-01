//
//  NSDictionary+HLHExtend.m
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import "NSDictionary+HLHExtend.h"

@implementation NSDictionary (HLHExtend)

- (NSString *)jsonString {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

@end
