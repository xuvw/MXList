//
//  MXReuseController.m
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXReuseController.h"
#import "NSObject+MXContentModel.h"
#import "UIView+MXContentView.h"

typedef NS_ENUM(NSInteger, MXReuseItemType) {
    MXReuseItemTypeXib,
    MXReuseItemTypeClass
};
@interface MXReuseItem : NSObject

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *reuseID;
@property (nonatomic, strong) NSMutableArray *reuseStack;
@property (nonatomic, assign) MXReuseItemType reuseType;
@property (nonatomic, strong) UINib *nibFileObj;

- (void)mx_push:(UIView *)cv;
- (UIView *)mx_pop;

@end

@implementation MXReuseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reuseStack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)mx_push:(UIView *)cv {
    [self.reuseStack addObject:cv];
}

- (UIView *)mx_pop {
    if (self.reuseStack.count < 1) {
        return nil;
    }
    UIView *view = self.reuseStack.firstObject;
    [self.reuseStack removeObject:view];
    return view;
}

- (void)dealloc {
}

@end

@interface MXReuseController()

@property (nonatomic, strong) NSMutableDictionary *reuseMap;

@end


@implementation MXReuseController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reuseMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self mx_registViewWithName:className reuseID:reuseID type:MXReuseItemTypeXib];
}

- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self mx_registViewWithName:className reuseID:reuseID type:MXReuseItemTypeClass];
}

- (void)mx_registViewWithName:(NSString *)className reuseID:(NSString *)reuseID type:(MXReuseItemType)itemType {
    if (className.length < 1 || reuseID.length < 1) {
        return;
    }
    NSArray *reuseIDList = [self.reuseMap allKeys];
    if ([reuseIDList containsObject:reuseID]) {
        return;
    }
    MXReuseItem *reuseItem = [[MXReuseItem alloc] init];
    reuseItem.className = className;
    reuseItem.reuseID = reuseID;
    reuseItem.reuseType = itemType;
    if (itemType == MXReuseItemTypeXib) {
        reuseItem.nibFileObj = [UINib nibWithNibName:className bundle:nil];
    }
    [self.reuseMap setObject:reuseItem forKey:reuseID];
}

- (void)mx_pushContentView:(UIView *)cv {
    [cv removeFromSuperview];
    
    NSString *reuseID = [[cv class] mxIdentifier];
    MXReuseItem *item = [self.reuseMap objectForKey:reuseID];
    if (!item) {
        return;
    }
    [item mx_push:cv];
}

- (UIView *)popContentViewWithReuseID:(NSString *)reuseID {
    MXReuseItem *item = [self.reuseMap objectForKey:reuseID];
    if (!item) {
        return nil;
    }
    return [item mx_pop];
}

- (void)mx_clearReuseStack {
    [self.reuseMap removeAllObjects];
}

- (UIView *)mx_viewWithContentData:(NSObject *)contentData {
    
    UIView *cv = nil;
    
    NSString *reuseID = [contentData mxReuseID];
    MXReuseItem *item = [self.reuseMap objectForKey:reuseID];
    if (!item) {
        cv = [[UIView alloc] init];
    }else {
        cv = [item mx_pop];
        if (!cv) {
            if (item.reuseType == MXReuseItemTypeXib) {
                NSArray *views = [item.nibFileObj instantiateWithOwner:nil options:nil];
                //[[NSBundle mainBundle] loadNibNamed:item.className owner:nil options:nil];
                if (views != nil && views.count > 0) {
                    cv = (UIView *)(views[0]);
                }else {
                    cv = [[UIView alloc] init];
                }
            }else {
                if (NSClassFromString(item.className)) {
                    cv = [[NSClassFromString(item.className) alloc] init];
                }else {
                    cv = [[UIView alloc] init];
                }
            }
        }
    }
    
    return cv;
}

- (void)dealloc {
}

@end
