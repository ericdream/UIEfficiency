//
//  UIView+Test.m
//  SimpleControl
//
//  Created by Eric on 9/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "UIView+Test.h"

#import <objc/runtime.h>

static char kScontrolVieKey;
@implementation UIView (Test)
@dynamic scontrolView;
- (SControlView *)scontrolView{
    SControlView *view = objc_getAssociatedObject(self,  &kScontrolVieKey);
    if(!view){
         view = [[SControlView alloc] initWitView:self];
     objc_setAssociatedObject(self, &kScontrolVieKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return view;
    
}
- (UIView *(^)(NSString *format,...))formatest{
    return ^(NSString *format,...){
        va_list list;
        va_start(list, format);
        return self;
    };
}
- (UIView *(^)(NSString *text))text{
    return ^(NSString *text){
        self.scontrolView.sc_text(text);
        return self;
    };
}
- (UIView *(^)(NSInteger font))f_font{
    return ^(NSInteger font){
        self.scontrolView.sc_font(font);
        return self;
    };
}
@end
