//
//  SCLable.h
//  SimpleControl
//
//  Created by Eric on 26/12/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCLableDelegate
- (void)testDelegate;
@end
@protocol SCLableDelegate1
- (void)testDelegate1;
@end
@protocol SCLableDelegate3 <SCLableDelegate,SCLableDelegate1>

@end
@interface SCLable : UILabel <SCLableDelegate3>

- (instancetype)initWithComplete:(void (^)(SCLable *lable))complete;
@property(nonatomic,copy,readonly) SCLable *(^sc_text)(NSString *text);
@property(nonatomic,copy,readonly) SCLable *(^sc_frame)(CGRect frame);
@property(nonatomic,copy,readonly) SCLable *(^sc_frame1)(CGFloat x,CGFloat y,CGFloat withd,CGFloat height);
@property(nonatomic,copy,readonly) SCLable *(^sc_font)(NSInteger font);
@property(nonatomic,copy,readonly) SCLable *(^sc_textColor)(UIColor *color);
@property(nonatomic,copy,readonly) SCLable *(^addToView)(UIView *superView);
@property(nonatomic,copy,readonly) SCLable *(^sc_cornerRadius)(CGFloat radius);
@end

