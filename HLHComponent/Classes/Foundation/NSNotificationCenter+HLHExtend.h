//
//  NSNotificationCenter+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (HLHExtend)

/**
 在主线程中发送一条通知

 @param notification NSNotification对象
 */
- (void)postNotificationOnMainThread:(NSNotification *)notification;

/**
 在主线程中发送一条通知

 @param aName    用来生成新通知的通知名称
 @param anObject anObject 通知携带的对象
 */
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject;

/**
 在主线程中发送一条通知

 @param aName     用来生成新通知的通知名称
 @param anObject  通知携带的对象
 @param aUserInfo 通知携带的用户信息

 */
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

@end
