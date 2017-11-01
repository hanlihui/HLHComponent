//
//  UIView+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HLHExtend)

/**
 @return Create a snapshot image of the complete view hierarchy.
 */
- (UIImage *)snapshotImage;

/**
 Returns the view's view controller (may be nil).
 */
@property (nonatomic, readonly) UIViewController *viewController;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)removeAllSubviews;


/**
 Sets a corners with radius, given borderWidth & borderColor

 @param radius      The radius of the view
 @param borderWidth borderWidth
 @param borderColor borderColor
 */
-(void)cornerRadius: (CGFloat)radius borderWidth: (CGFloat)borderWidth borderColor: (UIColor *)borderColor;

#pragma mark - shortcuts for frame

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@end
