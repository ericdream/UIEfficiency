//
//  UILabel+test.m
//  UIEfficiency
//
//  Created by Eric on 3/7/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "UILabel+test.h"

@implementation UILabel (test)
+ (CreatLbBlock)creatLabel{
    return ^{
        UILabel *lb = [[UILabel alloc] init];
        return lb;
    };
}
- (LbBlock)setText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
@end
