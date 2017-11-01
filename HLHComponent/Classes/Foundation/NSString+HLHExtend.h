//
//  NSString+Hash.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/26.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HLHExtend)

#pragma mark - ======================== Hash
/**
 @return Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

/**
 @return Returns a lowercase NSString for sha1 hash.
 */
- (NSString *)sha1String;

/**
 @return Returns a lowercase NSString for sha256 hash.
 */
- (NSString *)sha256String;

/**
 @return Returns a lowercase NSString for sha512 hash.
 */
- (NSString *)sha512String;

/**
 @param key The hmac key
 
 @return Returns a lowercase NSString for hmac using algorithm md5 with key.
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 @param key The hmac key
 
 @return Returns a lowercase NSString for hmac using algorithm sha1 with key
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 @param key The hmac key
 
 @return Returns a lowercase NSString for hmac using algorithm sha256 with key
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 @param key The hmac key

 @return Returns a lowercase NSString for hmac using algorithm sha512 with key
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

#pragma mark -  ======================== Utilities
/**
 Returns YES if the target string is contained within the receiver.
 @param string A string to test the the receiver.
 
 @discussion Apple has implemented this method in iOS8.
 */
- (BOOL)containsString:(NSString *)string;

/**
 Trim blank characters (space and newline) in head and tail.
 @return the trimmed string.
 */
- (NSString *)stringByTrim;

@end
