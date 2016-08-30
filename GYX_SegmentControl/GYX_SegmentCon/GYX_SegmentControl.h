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
//滚动头部下的View集合
@protocol GYXDelegate <NSObject>


- (NSArray *)contentViewArray;

@end

@interface GYX_SegmentControl : UIView <UIScrollViewDelegate>
@property (nonatomic, assign) NSInteger currentIndex;
- (instancetype)initWithFrame:(CGRect)frame segCount:(NSArray *)segCount isChangeColor:(BOOL)ischangeColor;
@property (nonatomic, strong) NSArray *gyx_arr;

@property (nonatomic, strong) UIView *lineView;//滚动头部底下滚动的线
// topview bottomview 默认无色. 有需要可以调用下方set方法
@property (nonatomic, strong) UIView *topView;//滚动最上方线条
@property (nonatomic, strong) UIView *bottomView;//下方线条
@property (nonatomic, strong) UIScrollView *gyxScrollView;
@property (nonatomic, strong) UIScrollView *gyxBottomScrollView;
@property (nonatomic, assign) CGFloat scrollHeight;
@property (nonatomic, assign) id<GYXDelegate> delegate;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *viewArr;// 可以是view数组或者viewcontroller数组,且数量必须与segCount相同
@property (nonatomic, assign) BOOL isChangeSelectColor;

@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, copy) NSString *selColorStr;
- (void)setTopViewBackgroundColor:(UIColor *)color;//顶部线条颜色
- (void)setBottomViewBackgroundColor:(UIColor *)color;//底部线条颜色
- (void)setLineViewBackgroundColor:(UIColor *)color;//滚动线条的颜色
//- (void)setViewArr:(NSArray *)viewArr;
- (void)setselColor:(UIColor *)color ;//选中颜色
- (void)setselColorStr:(NSString *)colorStr ;//选中颜色
- (void)setBetweenItemViewBackgroundColor:(UIColor *)color;//两个item中间线条颜色

@end

@interface GYX_Item : UIView
@property (nonatomic, strong) UIButton *itemBtn;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) UIView *behindView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *betweenItemView;
@end


