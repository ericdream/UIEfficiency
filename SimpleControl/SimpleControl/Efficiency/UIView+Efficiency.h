//
//  UIView+Efficiency.h
//  SimpleControl
//
//  Created by Eric on 10/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "EfficiencyProtocol.h"
#import "EfficiencyViewMaker.h"
typedef void(^ButtonActionBlock)(UIButton *sender);

@interface UIView (Efficiency)
@property (nonatomic,strong)EfficiencyViewMaker *viewMaker;
+ (id)createObject;
- (void)removeMaker;
- (UIView *(^)(CGRect frame))eFrame;
- (UIView *(^)(CGFloat x,CGFloat y,CGFloat withd,CGFloat height))eFrame1;

- (UIView *(^)(NSString *text))eText;
- (UIView *(^)(NSAttributedString *attributedText))eAttributedText;

- (UIView *(^)(NSString *color))eTextColor;

// text or title color
- (UIView *(^)(CGFloat font))eFont;

- (UIView *(^)(CGFloat cornerRadius))eCornerRadius;

- (UIView *(^)(BOOL userInteractionEnabled))eUserInteractionEnabled;

- (UIView *(^)(NSString *color))eBackgroundColor;

#pragma mark - button
- (UIView *(^)(NSString *title,UIControlState state))eTitle;
- (UIView *(^)(NSAttributedString *attributedText,UIControlState state))eAttributedTitle;
- (UIView *(^)(NSString *color,UIControlState state))eTitleColor;
- (UIView *(^)(void))addTargetAction:(void(^)(UIButton *sender))callBack;
- (UIView *(^)(ButtonActionBlock buttonActionBlock))addTargetAction;
#pragma mark - UILabel
- (UIView *(^)(NSInteger numberOfLines))eNumberOfLines;
- (UIView *(^)(NSTextAlignment textAlignment))eTextAlignment;

#pragma mark - UIImageView
- (UIView *(^)(NSString *imageName))eImage;
- (UIView *(^)(NSString *colorString,CGSize imageSize))imageWithColor;
#pragma mark - add view
- (UIView *(^)(UIView *superView))addToView;
@end





