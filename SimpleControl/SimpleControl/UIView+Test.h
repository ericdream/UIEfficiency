//
//  UIView+Test.h
//  SimpleControl
//
//  Created by Eric on 9/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SControlView.h"
@interface UIView (Test)
@property (nonatomic,strong) SControlView *scontrolView;
- (UIView *(^)(NSString *text))t_text;
- (UIView *(^)(NSString *text,UIControlState state))text;
- (UIView *(^)(NSInteger font))f_font;
- (UIView *(^)(NSString *format,...))formatest;

@end
