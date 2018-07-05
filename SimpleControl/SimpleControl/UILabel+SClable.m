//
//  UILabel+SClable.m
//  SimpleControl
//
//  Created by Eric on 16/1/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "UILabel+SClable.h"

@implementation UILabel (SClable)
- (UILabel *(^)(NSString *))text_t{
   return ^(NSString *title){
       self.text = title;
       return self;
   };
}
@end
