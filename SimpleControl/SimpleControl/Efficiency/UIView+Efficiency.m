//
//  UIView+Efficiency.m
//  SimpleControl
//
//  Created by Eric on 10/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "UIView+Efficiency.h"
#import <objc/runtime.h>
static char KEfficiencyViewMaker;
@implementation UIView (Efficiency)
@dynamic viewMaker;
+ (id )createObject{
    return [EfficiencyViewMaker createObjcetWithClass:[self class]];
}
- (EfficiencyViewMaker *)viewMaker{
    EfficiencyViewMaker *view = objc_getAssociatedObject(self,  &KEfficiencyViewMaker);
    if(!view){
        view = [[EfficiencyViewMaker alloc] initWitView:self];
        objc_setAssociatedObject(self, &KEfficiencyViewMaker, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return view;
}
- (void)removeMaker{
    objc_removeAssociatedObjects(self);
}
- (UIView *(^)(CGRect frame))eFrame{
    return ^(CGRect frame){
        [self.viewMaker setFrame:frame];
        return self;
    };
}
- (UIView *(^)(CGFloat x,CGFloat y,CGFloat withd,CGFloat height))eFrame1{
    return ^(CGFloat x,CGFloat y,CGFloat withd,CGFloat height){
        CGRect frame = CGRectMake(x, y, withd, height);
        [self.viewMaker setFrame:frame];
        return self;
    };
}

- (UIView *(^)(NSString *text))eText{
    return ^(NSString *text){
        [self.viewMaker setText:text];
        return self;
    };
}
- (UIView *(^)(NSAttributedString *attributedText))eAttributedText{
    return ^(NSAttributedString *attributedText){
        [self.viewMaker setAttributedText:attributedText];
        return self;
    };
}

- (UIView *(^)(NSString *color))eTextColor{
    return ^(NSString *color){
        [self.viewMaker setTextColor:color];
        return self;
    };
}

// text or title color
- (UIView *(^)(CGFloat font))eFont{
    return ^(CGFloat font){
        [self.viewMaker setFont:font];
        return self;
    };
}

- (UIView *(^)(CGFloat cornerRadius))eCornerRadius{
    return ^(CGFloat cornerRadius){
        [self.viewMaker setCornerRadius:cornerRadius];
        return self;
    };
}

- (UIView *(^)(UIView *superView))addToView{
    return ^(UIView *superView){
        [self.viewMaker addToView:superView];
        return self;
    };
}

- (UIView *(^)(NSString *shadowColor))eShadowColor{
    return ^(NSString *shadowColor){
        [self.viewMaker setShadowColor:shadowColor];
        return self;
    };
}
- (UIView *(^)(CGSize shadowOffset))eShadowOffset{
    return ^(CGSize shadowOffset){
        [self.viewMaker setShadowOffset:shadowOffset];
        return self;
    };
}

- (UIView *(^)(BOOL userInteractionEnabled))eUserInteractionEnabled{
    return ^(BOOL userInteractionEnabled){
        [self.viewMaker setUserInteractionEnabled:userInteractionEnabled];
        return self;
    };
}
- (UIView *(^)(NSString *color))eBackgroundColor{
    return ^(NSString *color){
        [self.viewMaker setBackgroundColor:color];
        return self;
    };
}
#pragma mark - button
- (UIView *(^)(NSString *title,UIControlState state))eTitle{
    return ^(NSString *title,UIControlState state){
        [self.viewMaker setTitle:title state:state];
        return self;
    };
}
- (UIView *(^)(NSAttributedString *attributedText,UIControlState state))eAttributedTitle{
    return ^(NSAttributedString *attributedText,UIControlState state){
        [self.viewMaker setAttributedTitle:attributedText state:state];
        return self;
    };
}

- (UIView *(^)(NSString *color,UIControlState state))eTitleColor{
    return ^(NSString *color,UIControlState state){
        [self.viewMaker setTtitleColor:color state:state];
        return self;
    };
}
- (UIView *(^)(void))addTargetAction:(void(^)(UIButton *sender))callBack{
    return ^(){
        [self.viewMaker addTargetAction:callBack];
        return self;
    };
}
- (UIView *(^)(ButtonActionBlock buttonActionBlock))addTargetAction{
    return ^(ButtonActionBlock buttonActionBlock){
        [self.viewMaker addTargetAction:buttonActionBlock];
        return self;
    };
}
#pragma mark - UILabel
- (UIView *(^)(NSInteger numberOfLines))eNumberOfLines{
    return ^(NSInteger numberOfLines){
        [self.viewMaker setNumberOfLines:numberOfLines];
        return self;
    };
}
- (UIView *(^)(NSTextAlignment textAlignment))eTextAlignment{
    return ^(NSTextAlignment textAlignment){
        [self.viewMaker setTextAlignment:textAlignment];
        return self;
    };
}

#pragma mark - UIImageView
- (UIView *(^)(NSString *imageName))eImage{
    return ^(NSString *imageName){
        [self.viewMaker setImage:imageName];
        return self;
    };
}
- (UIView *(^)(NSString *colorString,CGSize imageSize))imageWithColor{
    return ^(NSString *colorString,CGSize imageSize){
        [self.viewMaker setImageWith:colorString size:imageSize];
        return self;
    };
}
@end


