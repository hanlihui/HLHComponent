//
//  HLHCommonTableDelegate.h
//  HLHComponent_Example
//
//  Created by lihuiHan on 2017/10/31.
//  Copyright © 2017年 hanlihui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HLHCommonTableDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>

- (instancetype) initWithTableData:(NSArray *(^)(void))data;

@property (nonatomic,assign) CGFloat defaultSeparatorLeftEdge;

@end
