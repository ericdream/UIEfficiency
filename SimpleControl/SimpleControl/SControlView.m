//
//  SControlView.m
//  SimpleControl
//
//  Created by Eric on 9/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "SControlView.h"
@interface SControlView ()
@property (nonatomic,strong)UIView *view;
@end
@implementation SControlView
- (instancetype)initWitView:(UIView *)view{
    if([super init]){
        _view = view;
    }
    return self;
}
- (SControlView *(^)(NSString *))sc_text{
    return ^(NSString *text){
        if([_view isKindOfClass:[UILabel class]]){
            UILabel *lb = (UILabel *)_view;
            lb.text = text;
        }else if ([_view isKindOfClass:[UIButton class]]){
            UIButton *btn = (UIButton *)_view;
            [btn setTitle:text forState:UIControlStateNormal];
        }
        return self;
    };
}
//- (UIView *(^)(CGRect))sc_frame{
//    return ^(CGRect frame){
//        self.frame = frame;
//        return self;
//    };
//}
- (SControlView *(^)(NSInteger))sc_font{
    return ^(NSInteger font){
        if([_view isKindOfClass:[UILabel class]]){
            UILabel *lb = (UILabel *)_view;
            lb.font = [UIFont systemFontOfSize:font];
        }else if ([_view isKindOfClass:[UIButton class]]){
            UIButton *btn = (UIButton *)_view;
            btn.titleLabel.font = [UIFont systemFontOfSize:font];
        }
        return self;
    };
}
//- (UIView *(^)(UIColor *))sc_textColor{
//    return ^(UIColor *color){
//        self.textColor = color;
//        return self;
//    };
//}
//- (UIView *(^)(UIView *))addToView{
//    return ^(UIView *view){
//        [view addSubview:self];
//        return self;
//    };
//}
//- (UIView *(^)(CGFloat))sc_cornerRadius{
//    return ^(CGFloat radius){
//        self.layer.cornerRadius = radius;
//        self.layer.masksToBounds = YES;
//        return self;
//    };
//}
@end
