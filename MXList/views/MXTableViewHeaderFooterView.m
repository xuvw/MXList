//
//  MXTableViewHeaderFooterView.m
//  MXList
//
//  Created by heke on 2017/11/7.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXTableViewHeaderFooterView.h"
#import "MXReuseController.h"
#import "NSObject+MXContentModel.h"
#import "UIView+MXContentView.h"

@implementation MXTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //--
    }
    return self;
}

- (void(^)(MXReuseController *reuseController, NSObject *contentData))createContentView {
    __weak typeof(self)weakSelf = self;
    return ^(MXReuseController *reuseController, NSObject *contentData) {
        
        weakSelf.mxContentView = [reuseController mx_viewWithContentData:contentData];
        CGSize rSize = [contentData mxContentSize];
        weakSelf.mxContentView.frame = CGRectMake(0, 0, rSize.width, rSize.height);
        [weakSelf.contentView addSubview:weakSelf.mxContentView];
        [weakSelf.mxContentView fillData:contentData];
    };
}

@end
