//
//  NSNotificationCenter+HLHExtend.m
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import "NSNotificationCenter+HLHExtend.h"

@implementation NSNotificationCenter (HLHExtend)

- (void)postNotificationOnMainThread:(NSNotification *)notification {
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject {
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self postNotificationOnMainThread:notification];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotificationOnMainThread:notification];
}

@end
