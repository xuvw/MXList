//
//  MXSectionModel.h
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXSectionModel : NSObject

@property (nonatomic, strong) NSObject             *headerData;
@property (nonatomic, strong) NSMutableArray       *listData;
@property (nonatomic, strong) NSObject             *footerData;

- (NSInteger)mxCellCount;

@end
