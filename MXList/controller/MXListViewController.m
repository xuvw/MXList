//
//  MXListViewController.m
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXListViewController.h"
#import "MXTableViewCell.h"
#import "MXTableViewHeaderFooterView.h"

@interface MXListViewController ()
{
    CGRect windowRt;
}
@end

@implementation MXListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self mx_addTableView];
}

- (void)mx_addTableView {
    self.mx_list = [[MXTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self mx_registComponents];
    self.mx_list.backgroundColor = [UIColor whiteColor];
    self.mx_list.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mx_list.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:self.mx_list];
}

- (void)mx_registComponents {
    [self.mx_list registerClass:[MXTableViewCell class] forCellReuseIdentifier:@"MXTableViewCell"];
    [self.mx_list registerClass:[MXTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"MXTableViewHeaderFooterView"];
}

- (void)dealloc {
}

@end
