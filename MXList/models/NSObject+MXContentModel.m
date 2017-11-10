//
//  NSObject+MXContentModel.m
//  MXList
//
//  Created by heke on 2017/11/2.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "NSObject+MXContentModel.h"
#import <objc/message.h>


@implementation NSObject (MXContentModel)

- (void)setMxContentSize:(CGSize)mxContentSize {
    objc_setAssociatedObject(self, _cmd, [NSValue valueWithCGSize:mxContentSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)mxContentSize {
    NSValue *v = objc_getAssociatedObject(self, @selector(setMxContentSize:));
    if (!v) {
        return CGSizeZero;
    }
    return [v CGSizeValue];
}

- (void)setMxReuseID:(NSString *)mxReuseID {
    objc_setAssociatedObject(self, _cmd, mxReuseID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)mxReuseID {
    NSString *reuseID = objc_getAssociatedObject(self, @selector(setMxReuseID:));
    if (reuseID.length < 1) {
        return kMXDefaultReuseID;
    }else {
        return reuseID;
    }
}

- (void)bindWith:(Class)class {
    self.mxReuseID = NSStringFromClass(class);
}

@end
