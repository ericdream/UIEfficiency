//
//  UILabel+test.h
//  UIEfficiency
//
//  Created by Eric on 3/7/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef UILabel *(^CreatLbBlock)(void);
typedef UILabel *(^LbBlock)(NSString *content);
@interface UILabel (test)
+ (CreatLbBlock)creatLabel;
- (LbBlock)setText;

@end
