//
//  MXTableViewCell.h
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MXReuseController;
@interface MXTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *mxContentView;

@property (nonatomic, copy) void(^createContentView)(MXReuseController *reuseController, NSObject *contentData);

@end
