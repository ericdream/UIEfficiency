//
//  ViewController.m
//  SimpleControl
//
//  Created by Eric on 26/12/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+test.h"
//#import "SCLable.h"
//#import "UILabel+SClable.h"
//#import "UIView+Test.h"
//#import <Masonry.h>
//#import "Efficiency.h"
//#import "Efficiency/UIView+Efficiency.h"
//#import <objc/runtime.h>
//#import <objc/message.h>
typedef void (^TestBlock)();
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addImage;
@property(nonatomic,copy) TestBlock testBlock;
@property (nonatomic,strong) UIButton *button;
@end

@implementation ViewController
- (IBAction)addImageAction:(id)sender {
//    UIImageView *imageView = [UIImageView createObject];
//    imageView.eFrame1(100,110,200,400).eImage(@"1.png").addToView(self.view);
//    [imageView removeMaker];
//    imageView.eFrame1(100,110,200,400).imageWithColor(@"342562",CGSizeMake(200, 400)).addToView(self.view);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSCache *cache = [[NSCache alloc] init];
    UIColor *color = [UIColor whiteColor];
    CGRect frame = CGRectMake(100, 100, 100, 20);
    UILabel *lb = UILabel.creatLabel().setText(@"");
    
    lb.setText(@"eric");
    lb.textColor= [UIColor redColor];
    [self.view addSubview:lb];
//
//    self.testBlock = ^{
//        [self.addImage setTitle:@"z" forState:UIControlStateNormal];
//    };
//    self.testBlock();
//    [[SCLable alloc] initWithComplete:^(SCLable *lable) {
//        lable.sc_frame(frame).sc_textColor(color).sc_font(20).sc_text(@"链式编程").addToView(self.view);
//        lable.sc_cornerRadius(5);
////        lable.sc_frame1(1, 1, 1, 1).sc_font(12);
//        lable.backgroundColor = [UIColor darkGrayColor];
//
//        lable.highlightedTextColor = [UIColor redColor];
//        lable.highlighted = YES;
//        [lable testDelegate];
//        [lable testDelegate1];
//    }];
//
//
//
//  UILabel *lb =  [UILabel createObject];
//    lb.eFrame1(100,140,200,20);
//    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"sdsdsdsk"];
//    [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 6)];
////    lb.eAttributedText(att);
//    lb.eText(@"sdfsd");
//    lb.eTextColor(@"612231");
//    lb.eTextAlignment(NSTextAlignmentCenter);
//
//    lb.eNumberOfLines(3).eBackgroundColor(@"44357e");
////    lb.numberOfLines = 3;
//    [self.view addSubview:lb];
//    [lb removeMaker];
//    NSError *error;
//    [self openFile:@"" error:&error];
//    NSLog(@"-----%@",error);
//    lb.eTitle(@"button demo",UIControlStateNormal);
//    _button = [UIButton createObject];
//
//    _button.eTitle(@"button demo",UIControlStateNormal);
//    _button.eFrame1(100,160,100,30);
//    _button.eBackgroundColor(@"234235");
//    _button.addTargetAction(^(UIButton*button){
//        NSLog(@"button action");
//        [self.addImage setTitle:@"" forState:UIControlStateNormal];
//    });
//    _button.addToView(self.view);
//    [_button removeMaker];
}
- (void)openFile:(NSString *)path error:(NSError **)error{
    NSString *domain = @"domain";
    if(error){
    *error = [NSError errorWithDomain:domain code:100 userInfo:@{@"local":@"test demo",@"user":@"eric"}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
