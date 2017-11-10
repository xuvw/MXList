//
//  MXReuseController.h
//  MXList
//
//  Created by heke on 2017/10/31.
//  Copyright © 2017年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MXReuseController : NSObject

- (void)registXibWithName:(NSString *)className reuseID:(NSString *)reuseID;
- (void)registClassWithName:(NSString *)className reuseID:(NSString *)reuseID;

- (void)mx_pushContentView:(UIView *)cv;
- (UIView *)popContentViewWithReuseID:(NSString *)reuseID;
- (void)mx_clearReuseStack;

- (UIView *)mx_viewWithContentData:(NSObject *)contentData;

@end
