//
//  MXSectionModel.m
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXSectionModel.h"

@implementation MXSectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listData = @[].mutableCopy;
    }
    return self;
}

- (NSInteger)mxCellCount {
    return self.listData.count;
}

- (void)dealloc {
}

@end
