//
//  HLHCommonTableData.m
//  HLHComponent_Example
//
//  Created by lihuiHan on 2017/10/31.
//  Copyright © 2017年 hanlihui. All rights reserved.
//

#import "HLHCommonTableData.h"

static const CGFloat DefaultRowHeight    = 50.f;
static const CGFloat DefaultHeaderHeight = 44.f;
static const CGFloat DefaultFooterHeight = 44.f;

@implementation HLHCommonTableSection

- (instancetype) initWithDict:(NSDictionary *)dict{
    if ([dict[HLHDisable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _headerTitle = dict[HLHHeaderTitle];
        _footerTitle = dict[HLHFooterTitle];
        _footerHeight = [dict[HLHFooterHeight] floatValue];
        _headerHeight = [dict[HLHHeaderHeight] floatValue];
        _headerHeight = _headerHeight ? _headerHeight : DefaultHeaderHeight;
        _footerHeight = _footerHeight ? _footerHeight : DefaultFooterHeight;
        _rows = [HLHCommonTableRow rowsWithData:dict[HLHRowContent]];
    }
    return self;
}

+ (NSArray *)sectionsWithData:(NSArray *)data{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            HLHCommonTableSection * section = [[HLHCommonTableSection alloc] initWithDict:dict];
            if (section) {
                [array addObject:section];
            }
        }
    }
    return array;
}

@end

@implementation HLHCommonTableRow

- (instancetype) initWithDict:(NSDictionary *)dict{
    if ([dict[HLHDisable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _title          = dict[HLHTitle];
        _detailTitle    = dict[HLHDetailTitle];
        _cellClassName  = dict[HLHCellClass];
        _cellActionName = dict[HLHCellAction];
        _rowHeight    = dict[HLHRowHeight] ? [dict[HLHRowHeight] floatValue] : DefaultRowHeight;
        _extraInfo      = dict[HLHExtraInfo];
        _sepLeftEdge    = [dict[HLHSepLeftEdge] floatValue];
        _showAccessory  = [dict[HLHShowAccessory] boolValue];
        _forbidSelect   = [dict[HLHForbidSelect] boolValue];
    }
    return self;
}

+ (NSArray *)rowsWithData:(NSArray *)data{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            HLHCommonTableRow * row = [[HLHCommonTableRow alloc] initWithDict:dict];
            if (row) {
                [array addObject:row];
            }
        }
    }
    return array;
}

@end
