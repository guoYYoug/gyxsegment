//
//  GYX_SegmentControl.h
//  GYX_SegmentControl
//
//  Created by DLAB on 16/7/1.
//  Copyright © 2016年 DLAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define LineColor [UIColor blackColor]
#define rightHcolor [UIColor blackColor]
#define SCROLL_COLOR [UIColor greenColor]
#define ITEM_OtherView_WidOrHei 1
#define ITEM_FONTSIZE 17

//typedef NSMutableArray * (^contentBlock)();
@class GYX_Item;

@protocol GYXDelegate <NSObject>


- (NSArray *)contentViewArray;

@end

@interface GYX_SegmentControl : UIView <UIScrollViewDelegate>
@property (nonatomic, assign) NSInteger currentIndex;
- (instancetype)initWithFrame:(CGRect)frame segCount:(NSArray *)segCount isChangeColor:(BOOL)ischangeColor;
@property (nonatomic, strong) NSArray *gyx_arr;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIScrollView *gyxScrollView;
@property (nonatomic, strong) UIScrollView *gyxBottomScrollView;
@property (nonatomic, assign) CGFloat scrollHeight;
@property (nonatomic, assign) id<GYXDelegate> delegate;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *viewArr;
@property (nonatomic, assign) BOOL isChangeSelectColor;

@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, copy) NSString *selColorStr;
- (void)setTopViewBackgroundColor:(UIColor *)color;
- (void)setBottomViewBackgroundColor:(UIColor *)color;
- (void)setLineViewBackgroundColor:(UIColor *)color;
//- (void)setViewArr:(NSArray *)viewArr;
- (void)setselColor:(UIColor *)color ;
- (void)setselColorStr:(NSString *)colorStr ;
- (void)setBetweenItemViewBackgroundColor:(UIColor *)color;

@end

@interface GYX_Item : UIView
@property (nonatomic, strong) UIButton *itemBtn;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) UIView *behindView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *betweenItemView;
@end


