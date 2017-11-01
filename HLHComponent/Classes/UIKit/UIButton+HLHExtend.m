//
//  UIButton+HLHExtend.m
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import "UIButton+HLHExtend.h"

@implementation UIButton (HLHExtend)

- (void)imagePosition:(ButtonImagePosition)imagePosition space:(CGFloat)space {
    [self imagePosition:imagePosition space:space padding:UIEdgeInsetsZero];
}

- (void)imagePosition:(ButtonImagePosition)imagePosition
                space:(CGFloat)space
              padding:(UIEdgeInsets)padding {
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    switch (imagePosition) {
        case ButtonImagePositionTop:
        case ButtonImagePositionBottom: {
            
            int direction = imagePosition == ButtonImagePositionTop ? -1 : 1;
            
            [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + space) * direction, 0, 0,
                                                      -titleSize.width)];
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width,
                                                      (imageSize.height + space) * direction, 0)];
            
            CGFloat width = MAX(imageSize.width, titleSize.width);
            CGFloat height = imageSize.height + titleSize.height + space;
            width = MAX(self.frame.size.width, width);
            height = MAX(self.frame.size.height, height);
            self.frame = UIEdgeInsetsInsetRect(
                                               CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height), padding);
        } break;
        case ButtonImagePositionLeft:
        case ButtonImagePositionRight: {
            int direction = imagePosition == ButtonImagePositionLeft ? -1 : 1;
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, (titleSize.width + space) * direction, 0,
                                                      -titleSize.width)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0,
                                                      (imageSize.width + space) * direction)];
            
            CGFloat width = imageSize.width + titleSize.width + space;
            CGFloat height = MAX(imageSize.height, titleSize.height);
            width = MAX(self.frame.size.width, width);
            height = MAX(self.frame.size.height, height);
            self.frame = UIEdgeInsetsInsetRect(
                                               CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height), padding);
        } break;
        default:
            break;
    }
}

@end
