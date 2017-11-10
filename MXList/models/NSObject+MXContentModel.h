//
//  NSObject+MXContentModel.h
//  MXList
//
//  Created by heke on 2017/11/2.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kMXDefaultReuseID @"kMXDefaultReuseID"
@interface NSObject (MXContentModel)

@property (nonatomic, assign) CGSize mxContentSize;
@property (nonatomic, copy)   NSString *mxReuseID;

@end
