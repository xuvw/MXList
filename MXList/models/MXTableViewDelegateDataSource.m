//
//  MXTableViewDelegateDataSource.m
//  MXList
//
//  Created by heke on 2017/11/9.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXTableViewDelegateDataSource.h"
#import "MXReuseController.h"
#import "MXSectionModel.h"
#import "MXTableViewCell.h"
#import "MXTableViewHeaderFooterView.h"
#import "NSObject+MXContentModel.h"
#import "UIView+MXContentView.h"

@interface MXTableViewDelegateDataSource()
{
    CGRect windowRt;
}

@property (nonatomic, strong) MXReuseController *reuseController;

@end


@implementation MXTableViewDelegateDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sectionList = [[NSMutableArray alloc] init];
        self.reuseController = [[MXReuseController alloc] init];
        windowRt = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (void)setSectionList:(NSMutableArray<MXSectionModel *> *)sectionList {
    _sectionList = sectionList;
    [self.tv setContentOffset:self.tv.contentOffset animated:NO];
}

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self.reuseController registXibWithName:className reuseID:reuseID];
}

- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID {
    [self.reuseController registClassWithName:className reuseID:reuseID];
}

#pragma mark - UITableView delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MXSectionModel *sectionModel = self.sectionList[section];
    return [sectionModel mxCellCount];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MXSectionModel *sectionModel = self.sectionList[indexPath.section];
    NSObject *cm = sectionModel.listData[indexPath.row];
    CGSize size = [cm mxContentSize];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = [self sizeWithContent:cm];
    }
    return size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MXTableViewCell *cell = (MXTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MXTableViewCell"
                                                                               forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MXSectionModel *sectionModel = self.sectionList[indexPath.section];
    NSObject *cm = sectionModel.listData[indexPath.row];
    ((MXTableViewCell *)cell).createContentView(self.reuseController, cm);
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.reuseController mx_pushContentView:((MXTableViewCell *)cell).mxContentView];
    [((MXTableViewCell *)cell).mxContentView didDisappear];
}

- (CGSize)sizeWithContent:(NSObject *)contentData {
    CGSize rsize = CGSizeZero;
    @autoreleasepool {
        UIView *cv = [self.reuseController mx_viewWithContentData:contentData];
        [cv fillData:contentData];
        
        if (cv.useFrameLayout) {
            rsize = [cv sizeThatFits:CGSizeMake(windowRt.size.width, 0)];
        }else {
            NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cv attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:windowRt.size.width];
            
            [cv addConstraint:widthFenceConstraint];
            rsize = [cv systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        }
        contentData.mxContentSize = rsize;
        [self.reuseController mx_pushContentView:cv];
    }
    
    return rsize;
}

#pragma mark - header footer view
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    MXSectionModel *sectionModel = self.sectionList[section];
    NSObject *headerData = sectionModel.headerData;
    if (!headerData) {
        return CGFLOAT_MIN;
    }
    CGSize size = [headerData mxContentSize];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = [self sizeWithContent:headerData];
    }
    return size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    MXSectionModel *sectionModel = self.sectionList[section];
    NSObject *footerData = sectionModel.footerData;
    if (!footerData) {
        return CGFLOAT_MIN;
    }
    CGSize size = [footerData mxContentSize];
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = [self sizeWithContent:footerData];
    }
    return size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MXTableViewHeaderFooterView"];
}

- (UIView  *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MXTableViewHeaderFooterView"];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    MXSectionModel *sectionModel = self.sectionList[section];
    NSObject *headerData = sectionModel.headerData;
    ((MXTableViewHeaderFooterView *)view).createContentView(self.reuseController, headerData);
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    MXSectionModel *sectionModel = self.sectionList[section];
    NSObject *footerData = sectionModel.footerData;
    ((MXTableViewHeaderFooterView *)view).createContentView(self.reuseController, footerData);
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    [self.reuseController mx_pushContentView:((MXTableViewHeaderFooterView *)view).mxContentView];
    [((MXTableViewHeaderFooterView *)view).mxContentView didDisappear];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    [self.reuseController mx_pushContentView:((MXTableViewHeaderFooterView *)view).mxContentView];
    [((MXTableViewHeaderFooterView *)view).mxContentView didDisappear];
}

@end
