//
//  UIImage+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HLHExtend)

#pragma mark - Create image

/**
 Create and return a 1x1 point size image with the given color.

 @param color The color.

 @return a 1x1 point size image with the given color.
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 Create and return a pure color image with the given color and size.
 
 @param color  The color.
 @param size   New image's size.
 
 @return a pure color image with the given color and size
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - modify image RoundCorner

/**
 Rounds a new image with a given corner size.

 @param radius The radius of each corner oval

 @return UIImage
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 Rounds a new image with a given corner size

 @param radius      The radius of each corner oval
 @param borderWidth The inset border line width
 @param borderColor he border stroke color. nil means clear color.

 @return UIImage
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

#pragma mark - modify image RoundCorner

@end
