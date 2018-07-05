//
//  UILabel+SClable.h
//  SimpleControl
//
//  Created by Eric on 16/1/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SClable)
- (UILabel*(^)(NSString *text))text_t;
@end
