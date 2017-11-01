//
//  HLHCommonTableViewCell.h
//  HLHComponent
//
//  Created by lihuiHan on 2017/11/1.
//  Copyright © 2017年 hanlihui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HLHCommonTableRow;

@protocol HLHCommonTableViewCell <NSObject>

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
- (void)refreshData:(HLHCommonTableRow *)rowData tableView:(UITableView *)tableView;

@end
