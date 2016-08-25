//
//  UIColor+AddColor.h
//  FlatUI
//
//  Created by lzhr on 5/3/13.
//  Copyright (c) 2013 lzhr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AddColor)

// 通过16进制字符串创建颜色, 例如: #F173AC 是粉色
/*
 用法: 
 
view.backgroundColor = [UIColor colorFromHexCode:@"#F173AC"];
 
 */
+ (UIColor *) colorFromHexCode:(NSString *)hexString;


+ (UIColor *) turquoiseColor;
+ (UIColor *) greenSeaColor;
+ (UIColor *) emerlandColor;
+ (UIColor *) nephritisColor;
+ (UIColor *) peterRiverColor;
+ (UIColor *) belizeHoleColor;
+ (UIColor *) amethystColor;
+ (UIColor *) wisteriaColor;
+ (UIColor *) wetAsphaltColor;
+ (UIColor *) midnightBlueColor;
+ (UIColor *) sunflowerColor;
+ (UIColor *) tangerineColor;
+ (UIColor *) carrotColor;
+ (UIColor *) pumpkinColor;
+ (UIColor *) alizarinColor;
+ (UIColor *) pomegranateColor;
+ (UIColor *) cloudsColor;
+ (UIColor *) silverColor;
+ (UIColor *) concreteColor;
+ (UIColor *) asbestosColor;
+ (UIColor *) ngaBackColor;
+ (UIColor *) ngaDarkColor;


@end
