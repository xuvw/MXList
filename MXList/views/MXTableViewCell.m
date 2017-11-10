//
//  MXTableViewCell.m
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import "MXTableViewCell.h"
#import "MXReuseController.h"
#import "NSObject+MXContentModel.h"
#import "UIView+MXContentView.h"

@interface MXTableViewCell()

@end

@implementation MXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
}

@end
