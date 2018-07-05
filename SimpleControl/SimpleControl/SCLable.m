//
//  SCLable.m
//  SimpleControl
//
//  Created by Eric on 26/12/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "SCLable.h"

@implementation SCLable
- (instancetype)initWithComplete:(void (^)(SCLable *))complete{
    if(self = [super init]){
        if(complete)complete(self);
    }
    return self;
}
- (void)testDelegate{
    NSLog(@"------%@",@"协议继承");
}
- (void)testDelegate1{
    NSLog(@"---testDelegate1---------");
}
- (SCLable *(^)(NSString *))sc_text{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
- (SCLable *(^)(CGRect))sc_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
- (SCLable *(^)(NSInteger))sc_font{
    return ^(NSInteger font){
        self.font = [UIFont systemFontOfSize:font];
        return self;
    };
}
- (SCLable *(^)(UIColor *))sc_textColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
- (SCLable *(^)(UIView *))addToView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}
- (SCLable *(^)(CGFloat))sc_cornerRadius{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
