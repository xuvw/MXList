//
//  MXTableViewHeaderFooterView.h
//  MXList
//
//  Created by heke on 2017/11/7.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MXReuseController;
@interface MXTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIView *mxContentView;
@property (nonatomic, copy) void(^createContentView)(MXReuseController *reuseController, NSObject *contentData);

@end
