//
//  HLHCommonTableData.h
//  HLHComponent_Example
//
//  Created by lihuiHan on 2017/10/31.
//  Copyright © 2017年 hanlihui. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -

static const CGFloat HLHSepLineLeft = 15.0f; //分割线距左边距离

//section key
static const NSString *HLHHeaderTitle   = @"HLHHeaderTitle";
static const NSString *HLHFooterTitle   = @"HLHFooterTitle";
static const NSString *HLHHeaderHeight  = @"HLHHeaderHeight";
static const NSString *HLHFooterHeight  = @"HLHFooterHeight";
static const NSString *HLHRowContent    = @"HLHRow";

//row key
static const NSString *HLHTitle         = @"HLHTitle";
static const NSString *HLHDetailTitle   = @"HLHDetailTitle";
static const NSString *HLHCellClass     = @"HLHCellClass";
static const NSString *HLHCellAction    = @"HLHAction";
static const NSString *HLHExtraInfo     = @"HLHExtraInfo";
static const NSString *HLHRowHeight     = @"HLHRowHeight";
static const NSString *HLHSepLeftEdge   = @"HLHLeftEdge";

//common key
static const NSString *HLHDisable       = @"HLHDisable";      //cell不可见
static const NSString *HLHShowAccessory = @"HLHAccessory";    //cell显示>箭头
static const NSString *HLHForbidSelect  = @"HLHForbidSelect"; //cell不响应select事件

#pragma mark - Section
@interface HLHCommonTableSection : NSObject

@property (nonatomic, copy  ) NSString *headerTitle;
@property (nonatomic, copy  ) NSArray  *rows;
@property (nonatomic, copy  ) NSString *footerTitle;
@property (nonatomic, assign) CGFloat   headerHeight;
@property (nonatomic, assign) CGFloat   footerHeight;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (NSArray *)sectionsWithData:(NSArray *)data;

@end

#pragma mark - Row
@interface HLHCommonTableRow : NSObject

@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *detailTitle;
@property (nonatomic, copy  ) NSString *cellClassName;
@property (nonatomic, copy  ) NSString *cellActionName;
@property (nonatomic, assign) CGFloat   rowHeight;
@property (nonatomic, assign) CGFloat   sepLeftEdge;
@property (nonatomic, assign) BOOL      showAccessory;
@property (nonatomic, assign) BOOL      forbidSelect;
@property (nonatomic, strong) id        extraInfo;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (NSArray *)rowsWithData:(NSArray *)data;

@end
