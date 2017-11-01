//
//  UIButton+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ButtonImagePositionLeft = 0, //图片显示在按钮左边
    ButtonImagePositionRight,    //图片显示在按钮右边
    ButtonImagePositionTop,      //图片显示在按钮上边
    ButtonImagePositionBottom,   //图片显示在按钮下边
} ButtonImagePosition;

@interface UIButton (HLHExtend)

/**
 setting the image position of the button

 @param imagePosition image position
 @param space         the space between the image and butten title
 */
- (void)imagePosition:(ButtonImagePosition)imagePosition space:(CGFloat)space;

/**
 setting the image position of the button
 
 @param imagePosition image position
 @param space         the space between the image and butten title
 @param padding       insets
 */
- (void)imagePosition:(ButtonImagePosition)imagePosition space:(CGFloat)space padding:(UIEdgeInsets)padding;

@end
