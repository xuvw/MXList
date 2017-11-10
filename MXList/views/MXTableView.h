//
//  MXTableView.h
//  MXList
//
//  Created by heke on 2017/11/9.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXTableViewDelegateDataSource.h"

@interface MXTableView : UITableView

@property (nonatomic, strong, readonly) MXTableViewDelegateDataSource *dd;

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID;
- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID;

@end
