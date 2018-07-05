//
//  EfficiencyViewMaker.m
//  SimpleControl
//
//  Created by Eric on 11/4/2018.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "EfficiencyViewMaker.h"
#import <CommonCrypto/CommonCrypto.h>
typedef NS_ENUM(NSInteger,ControlType) {
    TYPE_NONE = 0,
    TYPE_LABEL ,
    TYPE_BUTTON,
    TYPE_TEXTVIEW,
    TYPE_IAMGEVIEW,
    TYPE_TEXTFIELD,
}LbType;
@interface EfficiencyViewMaker()
@property (nonatomic,strong)UIView *view;
@property (nonatomic,strong)UILabel *eLabel;
@property (nonatomic,strong)UIButton *eButton;
@property (nonatomic,strong)UITextView *eTextView;
@property (nonatomic,strong)UITextField *eTextField;
@property (nonatomic,strong)UIImageView *eImageView;
@end
@implementation EfficiencyViewMaker{
    ControlType controlType;
    void (^buttonActionBlock)(UIButton *sender);

}
+ (id)createObjcetWithClass:(Class)class{
    return  [[class alloc] init];
}
- (instancetype)initWitView:(UIView *)view{
    if([super init]){
        _view = view;
        controlType = [self setUIControlType];
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    _view.frame = frame;
}
- (void)setText:(NSString *)text{
    if([_view respondsToSelector:@selector(setText:)]){
        [_view performSelector:@selector(setText:) withObject:text];
    }
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    if([_view respondsToSelector:@selector(setAttributedText:)]){
        [_view performSelector:@selector(setAttributedText:) withObject:attributedText];
    }
}
- (void)setFont:(CGFloat)font{
    if([_view respondsToSelector:@selector(setFont:)]){
        UIFont *fontObj = [UIFont systemFontOfSize:font];
        [_view performSelector:@selector(setFont:) withObject:fontObj];
    }
}
- (void)setTextColor:(NSString *)textColor{
    if([_view respondsToSelector:@selector(setTextColor:)]){
        UIColor *color = [self colorFromString:textColor];
        [_view performSelector:@selector(setTextColor:) withObject:color];
    }
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    _view.layer.cornerRadius = cornerRadius;
    _view.layer.masksToBounds = YES;
}
- (void)setShadowColor:(NSString *)shadowColor{
    if([_view respondsToSelector:@selector(setShadowColor:)]){
        UIColor *color = [self colorFromString:shadowColor];
        [_view performSelector:@selector(setShadowColor:) withObject:color];
    }
}
- (void)setShadowOffset:(CGSize)shadowOffset{
    if(_eLabel){
        _eLabel.shadowOffset = shadowOffset;
    }
}
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled{
    _view.userInteractionEnabled = userInteractionEnabled;
}
- (void)setBackgroundColor:(NSString *)color{
    UIColor *colorObj = [self colorFromString:color];
    _view.backgroundColor = colorObj;
}
#pragma mark - button
// button
- (void)setTitle:(NSString *)title state:(UIControlState)state{
    if(_eButton){
        [_eButton setTitle:title forState:state];
    }
}
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle state:(UIControlState)state{
    if(_eButton){
        [_eButton setAttributedTitle:attributedTitle forState:state];
    }
}
- (void)setTtitleColor:(NSString *)color state:(UIControlState)state{
    if(_eButton){
        UIColor *titleColor = [self colorFromString:color];
        [_eButton setTitleColor:titleColor forState:state];
    }
}
- (void)addTargetAction:(void (^)(UIButton *))callBack{
    if(_eButton){
        self->buttonActionBlock = callBack;
        [_eButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)buttonAction{
    if(self->buttonActionBlock){
        self->buttonActionBlock(_eButton);
    }
}
#pragma mark --label
//label
- (void)setNumberOfLines:(NSInteger)numberOfLines{
    if([_view respondsToSelector:@selector(setNumberOfLines:)]){
        [_view performSelector:@selector(setNumberOfLines:) withObject:@(numberOfLines)];
    }
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    switch (controlType) {
        case TYPE_LABEL:
            _eLabel.textAlignment = textAlignment;
            break;
        case TYPE_TEXTVIEW:
            _eTextView.textAlignment = textAlignment;
            break;
        case TYPE_TEXTFIELD:
            _eTextField.textAlignment = textAlignment;
            break;
        default:
            break;
    }
    _eLabel.textAlignment = textAlignment;
}
#pragma  mark - UIImageView
- (void)setImage:(NSString *)imageName{
    if(_eImageView){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *image = [UIImage imageNamed:imageName];
            CGImageRef imageRef = [self decodeImage:image.CGImage];
            UIImage *decodeImage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
            CGImageRelease(imageRef);
            
            if(decodeImage){
                dispatch_async(dispatch_get_main_queue(), ^{
                    _eImageView.image = decodeImage;
                });
            }
        });
        
    }
}
- (void)setImageWith:(NSString *)color size:(CGSize)size{
    if(_eImageView){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIColor *colorObj = [self colorFromString:color];
            UIImage *image = [self colorToImage:colorObj size:size];
            dispatch_async(dispatch_get_main_queue(), ^{
                _eImageView.image = image;
            });
        });
    }
}
- (void)addToView:(UIView *)superView{
    [superView addSubview:_view];
}

- (ControlType)setUIControlType{
    if([_view isKindOfClass:[UILabel class]]){
        _eLabel = (UILabel *)_view;
        return TYPE_LABEL;
    }else if ([_view isKindOfClass:[UIButton class]]){
        _eButton = (UIButton *)_view;
        return TYPE_BUTTON;
    }else if ([_view isKindOfClass:[UITextField class]]){
        _eTextField = (UITextField *)_view;
        return TYPE_TEXTFIELD;
    }else if ([_view isKindOfClass:[UITextView class]]){
        _eTextView = (UITextView *)_view;
        return TYPE_TEXTVIEW;
    }else if ([_view isKindOfClass:[UIImageView class]]){
        _eImageView = (UIImageView *)_view;
        return TYPE_IAMGEVIEW;
    }else{
        return TYPE_NONE;
    }
}


@end
@implementation EfficiencyViewMaker (Helper)
- (UIColor *)colorFromString:(NSString *)hexColorStr{
    NSAssert(hexColorStr.length>=6, @"color value format error");
    hexColorStr = [hexColorStr stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [hexColorStr substringWithRange:range];
    range.location = 2;
    NSString *gString = [hexColorStr substringWithRange:range];
    range.location = 4;
    NSString *bString = [hexColorStr substringWithRange:range];
    
    unsigned int r, g, b, a;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (hexColorStr.length == 8){
        range.location = 6;
        NSString *aString = [hexColorStr substringWithRange:range];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
    }
    else{
        a = 255;
    }
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
    
}
- (UIImage *)colorToImage:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (CGImageRef )decodeImage:(CGImageRef )imageRef{
    CGImageRef newImageRef = CGImageCreateDecodedCopy(imageRef, YES);
    return newImageRef;
}
CGImageRef CGImageCreateDecodedCopy(CGImageRef imageRef, BOOL decodeForDisplay) {
    if (!imageRef) return NULL;
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    if (width == 0 || height == 0) return NULL;
    
    if (decodeForDisplay) { //decode with redraw (may lose some precision)
        CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef) & kCGBitmapAlphaInfoMask;
        BOOL hasAlpha = NO;
        if (alphaInfo == kCGImageAlphaPremultipliedLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst ||
            alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaFirst) {
            hasAlpha = YES;
        }
        // BGRA8888 (premultiplied) or BGRX8888
        // same as UIGraphicsBeginImageContext() and -[UIView drawRect:]
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
        bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
        CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, 0, CGColorSpaceGetDeviceRGB(), bitmapInfo);
        if (!context) return NULL;
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef); // decode
        CGImageRef newImage = CGBitmapContextCreateImage(context);
        CFRelease(context);
        return newImage;
        
    } else {
        CGColorSpaceRef space = CGImageGetColorSpace(imageRef);
        size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
        size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
        size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
        CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
        if (bytesPerRow == 0 || width == 0 || height == 0) return NULL;
        
        CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
        if (!dataProvider) return NULL;
        CFDataRef data = CGDataProviderCopyData(dataProvider); // decode
        if (!data) return NULL;
        
        CGDataProviderRef newProvider = CGDataProviderCreateWithCFData(data);
        CFRelease(data);
        if (!newProvider) return NULL;
        
        CGImageRef newImage = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, newProvider, NULL, false, kCGRenderingIntentDefault);
        CFRelease(newProvider);
        return newImage;
    }
}

CGColorSpaceRef CGColorSpaceGetDeviceRGB() {
    static CGColorSpaceRef space;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        space = CGColorSpaceCreateDeviceRGB();
    });
    return space;
}

@end
