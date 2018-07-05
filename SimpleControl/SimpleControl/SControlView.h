//
//  SControlView.h
//  SimpleControl
//
//  Created by Eric on 9/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SControlView : NSObject
@property(nonatomic,copy,readonly) SControlView *(^sc_text)(NSString *text);
@property(nonatomic,copy,readonly) SControlView *(^sc_frame)(CGRect frame);
@property(nonatomic,copy,readonly) SControlView *(^sc_font)(NSInteger font);
@property(nonatomic,copy,readonly) SControlView *(^sc_textColor)(UIColor *color);
@property(nonatomic,copy,readonly) SControlView *(^addToView)(UIView *superView);
@property(nonatomic,copy,readonly) SControlView *(^sc_cornerRadius)(CGFloat radius);
- (instancetype)initWitView:(UIView *)view;
@end
