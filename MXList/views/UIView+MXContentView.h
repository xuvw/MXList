//
//  UIView+MXContentView.h
//  MXList
//
//  Created by heke on 2017/11/2.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXReuseController;
@class MXTableView;
@interface UIView (MXContentView)

/*
 default:NO默认使用自动布局
 使用手动布局必须实现：- (CGSize)sizeThatFits:(CGSize)size;方法，返回真实高度
 */
@property (nonatomic, assign) BOOL useFrameLayout;

+ (NSString *)mxIdentifier;
+ (void)mx_registXibTo:(MXTableView *)tableView;
+ (void)mx_registClassTo:(MXTableView *)tableView;

- (void)fillData:(NSObject *)data;
- (void)didDisappear;

@end
