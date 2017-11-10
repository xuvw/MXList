//
//  MXTableViewDelegateDataSource.h
//  MXList
//
//  Created by heke on 2017/11/9.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MXReuseController;
@class MXSectionModel;
@interface MXTableViewDelegateDataSource : NSObject
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tv;
@property (nonatomic, strong) NSMutableArray<MXSectionModel *> *sectionList;

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID;
- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID;

@end
