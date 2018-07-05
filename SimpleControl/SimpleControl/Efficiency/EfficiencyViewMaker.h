//
//  EfficiencyViewMaker.h
//  SimpleControl
//
//  Created by Eric on 11/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EfficiencyViewMaker : NSObject

- (instancetype)initWitView:(UIView *)view;
+ (id)createObjcetWithClass:(Class)class;
- (void)setFrame:(CGRect)frame;
- (void)setText:(NSString *)text;
- (void)setFont:(CGFloat)font;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setTextColor:(NSString *)textColor;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setShadowColor:(NSString *)shadowColor;
- (void)setShadowOffset:(CGSize)shadowOffset;
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled;
- (void)setBackgroundColor:(NSString *)color;
// button
- (void)setTitle:(NSString *)title state:(UIControlState)state;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle state:(UIControlState)state;
- (void)setTtitleColor:(NSString *)color state:(UIControlState)state;
- (void)addTargetAction:(void(^)(UIButton *sender))callBack;
//label
- (void)setNumberOfLines:(NSInteger)numberOfLines;
- (void)setTextAlignment:(NSTextAlignment)textAlignment;
#pragma mark - UIImageView
- (void)setImage:(NSString *)imageName;
- (void)setImageWith:(NSString *)color size:(CGSize)size;
- (void)addToView:(UIView *)superView;

@end

@interface EfficiencyViewMaker (Helper)
- (UIColor *)colorFromString:(NSString *)hexColorStr;
- (CGImageRef )decodeImage:(CGImageRef )imageRef;
- (UIImage *)colorToImage:(UIColor *)color size:(CGSize)size;
@end


