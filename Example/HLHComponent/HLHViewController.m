//
//  HLHViewController.m
//  HLHComponent
//
//  Created by hanlihui on 10/31/2017.
//  Copyright (c) 2017 hanlihui. All rights reserved.
//

#import "HLHViewController.h"
#import "HLHCommonTableData.h"
#import "HLHCommonTableDelegate.h"

@interface HLHViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) HLHCommonTableDelegate *delegate;

@end

@implementation HLHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [self buildData];
    
    self.delegate = [[HLHCommonTableDelegate alloc]initWithTableData:^NSArray *{
        return weakSelf.data;
    }];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
}

- (void)buildData{
    NSArray *data = @[@{
                          HLHHeaderTitle:@"",
                          HLHRowContent :@[
                                  @{
                                      HLHTitle         : @"我的钱包",
                                      HLHCellAction    : @"onTouchShowLog:",
                                      HLHShowAccessory : @(YES),
                                      },
                                  ],
                          },
                      @{
                          HLHHeaderTitle:@"",
                          HLHRowContent :@[
                                  @{
                                      HLHTitle      :@"消息提醒",
                                      HLHDetailTitle: @"未开启" ,
                                      },
                                  ],
                          HLHFooterTitle:@"在iPhone的“设置- 通知中心”功能，找到应用程序“云信”，可以更改云信新消息提醒设置"
                          },
                      @{
                          HLHHeaderTitle:@"",
                          HLHRowContent :@[
                                  @{
                                      HLHTitle      :@"免打扰",
                                      HLHDetailTitle: @"未开启",
                                      HLHCellAction :@"onTouchShowLog:",
                                      HLHShowAccessory : @(YES)
                                      },
                                  ],
                          HLHFooterTitle:@""
                          },
                      @{
                          HLHHeaderTitle:@"",
                          HLHRowContent :@[
                                  @{
                                      HLHTitle      :@"查看日志",
                                      HLHCellAction :@"onTouchShowLog:",
                                      },
                                  @{
                                      HLHTitle      :@"上传日志",
                                      HLHCellAction :@"onTouchShowLog:",
                                      },
                                  @{
                                      HLHTitle      :@"通知",
                                      HLHCellAction :@"onTouchShowLog:",
                                      },
                                  @{
                                      HLHTitle      :@"音视频网络探测",
                                      HLHCellAction :@"onTouchShowLog:",
                                      },
                                  @{
                                      HLHTitle      :@"关于",
                                      HLHCellAction :@"onTouchShowLog:",
                                      },
                                  ],
                          HLHFooterTitle:@""
                          },

                      ];
    self.data = [HLHCommonTableSection sectionsWithData:data];
}

- (void)onTouchShowLog:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"大闹天宫" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:ok];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
