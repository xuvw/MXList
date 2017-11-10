//
//  UIView+MXContentView.m
//  MXList
//
//  Created by heke on 2017/11/2.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "UIView+MXContentView.h"
#import "MXReuseController.h"
#import "MXTableView.h"
#import <objc/message.h>

@implementation UIView (MXContentView)

- (void)setUseFrameLayout:(BOOL)useFrameLayout {
    objc_setAssociatedObject(self, _cmd, [NSNumber numberWithBool:useFrameLayout], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)useFrameLayout {
    NSNumber *value = objc_getAssociatedObject(self, @selector(setUseFrameLayout:));
    if (value) {
        return [value boolValue];
    }else {
        return NO;
    }
}

+ (NSString *)mxIdentifier {
    return NSStringFromClass([self class]);
}

+ (void)mx_registXibTo:(MXTableView *)tableView {
    [tableView.dd registXibWithName:[self mxIdentifier] reuseID:[self mxIdentifier]];
}

+ (void)mx_registClassTo:(MXTableView *)tableView {
    [tableView.dd registClassWithName:[self mxIdentifier] reuseID:[self mxIdentifier]];
}

- (void)fillData:(NSObject *)data {
    //--需要业务类按需覆盖此方法
}

- (void)didDisappear {
    //--需要业务类按需覆盖此方法
}

@end
