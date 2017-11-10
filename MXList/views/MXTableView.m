//
//  MXTableView.m
//  MXList
//
//  Created by heke on 2017/11/9.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXTableView.h"

@implementation MXTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        _dd = [[MXTableViewDelegateDataSource alloc] init];
        self.dataSource = self.dd;
        self.delegate = self.dd;
        self.dd.tv = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _dd = [[MXTableViewDelegateDataSource alloc] init];
        self.dataSource = self.dd;
        self.delegate = self.dd;
        self.dd.tv = self;
    }
    return self;
}

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self.dd registXibWithName:className reuseID:reuseID];
}

- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self.dd registClassWithName:className reuseID:reuseID];
}

- (void)dealloc {
}

@end
