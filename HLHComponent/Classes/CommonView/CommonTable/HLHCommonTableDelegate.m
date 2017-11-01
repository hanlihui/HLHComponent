//
//  HLHCommonTableDelegate.m
//  HLHComponent_Example
//
//  Created by lihuiHan on 2017/10/31.
//  Copyright © 2017年 hanlihui. All rights reserved.
//

#import "HLHCommonTableDelegate.h"
#import "HLHCommonTableData.h"
#import "HLHCommonTableViewCell.h"
#import "UIView+HLHExtend.h"
#import "HLHGlobalMacro.h"

#define SepViewTag 10001

static NSString *DefaultTableCell = @"UITableViewCell";

@interface HLHCommonTableDelegate()

@property (nonatomic,copy) NSArray *(^HLHDataReceiver)(void);

@end

@implementation HLHCommonTableDelegate

- (instancetype) initWithTableData:(NSArray *(^)(void))data{
    self = [super init];
    if (self) {
        _HLHDataReceiver = data;
        _defaultSeparatorLeftEdge = HLHSepLineLeft;
    }
    return self;
}

- (NSArray *)data{
    return self.HLHDataReceiver();
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HLHCommonTableSection *tableSection = self.data[section];
    return tableSection.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HLHCommonTableSection *tableSection = self.data[indexPath.section];
    HLHCommonTableRow     *tableRow     = tableSection.rows[indexPath.row];
    NSString *identity = tableRow.cellClassName.length ? tableRow.cellClassName : DefaultTableCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        Class clazz = NSClassFromString(identity);
        cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
        UIView *sep = [[UIView alloc] initWithFrame:CGRectZero];
        sep.tag = SepViewTag;
        sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        sep.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:sep];
    }
    if (![cell respondsToSelector:@selector(refreshData:tableView:)]) {
        UITableViewCell *defaultCell = (UITableViewCell *)cell;
        [self refreshData:tableRow cell:defaultCell];
    }else{
        [(id<HLHCommonTableViewCell>)cell refreshData:tableRow tableView:tableView];
    }
    cell.accessoryType = tableRow.showAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HLHCommonTableSection *tableSection = self.data[indexPath.section];
    HLHCommonTableRow     *tableRow     = tableSection.rows[indexPath.row];
    return tableRow.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HLHCommonTableSection *tableSection = self.data[indexPath.section];
    HLHCommonTableRow     *tableRow     = tableSection.rows[indexPath.row];
    if (!tableRow.forbidSelect) {
        UIViewController *vc = tableView.viewController;
        NSString *actionName = tableRow.cellActionName;
        if (actionName.length) {
            SEL sel = NSSelectorFromString(actionName);
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            HLH_SuppressPerformSelectorLeakWarning([vc performSelector:sel withObject:cell]);
        }
    }
} 

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里的cell已经有了正确的bounds
    //不在cellForRow的地方设置分割线是因为在ios7下，0.5像素的view利用autoResizeMask调整布局有问题，会导致显示不出来，ios6,ios8均正常。
    //具体问题类似http://stackoverflow.com/questions/30663733/add-a-0-5-point-height-subview-to-uinavigationbar-not-show-in-ios7
    //这个回调里调整分割线的位置
    HLHCommonTableSection *tableSection = self.data[indexPath.section];
    HLHCommonTableRow     *tableRow     = tableSection.rows[indexPath.row];
    UIView *sep = [cell viewWithTag:SepViewTag];
    CGFloat sepHeight = .5f;
    CGFloat sepWidth;
    if (tableRow.sepLeftEdge) {
        sepWidth  = cell.width - tableRow.sepLeftEdge;
    }else{
        HLHCommonTableSection *section = self.data[indexPath.section];
        if (indexPath.row == section.rows.count - 1) {
            //最后一行
            sepWidth = 0;
        }else{
            sepWidth = cell.width - self.defaultSeparatorLeftEdge;
        }
    }
    sepWidth  = sepWidth > 0 ? sepWidth : 0;
    sep.frame = CGRectMake(cell.width - sepWidth, cell.height - sepHeight, sepWidth ,sepHeight);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    HLHCommonTableSection *tableSection = self.data[section];
    return tableSection.headerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 25.f;
    }
    HLHCommonTableSection *tableSection = self.data[section];
    return [tableSection.headerTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.f]}].height;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    HLHCommonTableSection *tableSection = self.data[section];
    return tableSection.footerTitle;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HLHCommonTableSection *tableSection = self.data[section];
    if (tableSection.headerTitle.length) {
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    HLHCommonTableSection *tableSection = self.data[section];
    if (tableSection.footerTitle.length) {
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

#pragma mark - Private
- (void)refreshData:(HLHCommonTableRow *)rowData cell:(UITableViewCell *)cell{
    cell.textLabel.text = rowData.title;
    cell.detailTextLabel.text = rowData.detailTitle;
}


@end
