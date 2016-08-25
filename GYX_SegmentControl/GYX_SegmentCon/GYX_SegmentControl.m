//
//  GYX_SegmentControl.m
//  GYX_SegmentControl
//
//  Created by DLAB on 16/7/1.
//  Copyright © 2016年 DLAB. All rights reserved.
//

#import "GYX_SegmentControl.h"
#import <objc/runtime.h>
#import "UIColor+AddColor.h"
#define GYX_SEG_HEIGHT 42
#define GYX_ITEM_HEIGHT 40
#define LINE_HEIGHT 2

@implementation GYX_SegmentControl



- (instancetype)initWithFrame:(CGRect)frame segCount:(NSArray *)segCount isChangeColor:(BOOL)ischangeColor{
    self = [super initWithFrame:frame];
    if (self) {
        _isChangeSelectColor = ischangeColor;
        _gyx_arr = [NSArray arrayWithArray:segCount];
        CGFloat widthSum = 0;
        self.gyxScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1, frame.size.width, GYX_SEG_HEIGHT)];
        self.gyxScrollView.backgroundColor = SCROLL_COLOR;
        self.gyxScrollView.showsVerticalScrollIndicator = NO;
        self.gyxScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.gyxScrollView];
        for (NSInteger i = 0; i < _gyx_arr.count; i++) {
            GYX_Item *item = [[GYX_Item alloc] init];
            [self.gyxScrollView addSubview:item];
            [item.itemBtn setTitle:_gyx_arr[i] forState:UIControlStateNormal];
           
            NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:ITEM_FONTSIZE]};
            CGRect rect = [_gyx_arr[i] boundingRectWithSize:CGSizeMake(10000, GYX_ITEM_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            item.frame = CGRectMake(0 + widthSum, 0, rect.size.width + 15, GYX_ITEM_HEIGHT);
            widthSum = widthSum + rect.size.width + 15;
            item.tag = i + 100;
            item.itemBtn.tag = i + 1000;
            [item.itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [item.itemBtn addTarget:self action:@selector(doTap:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }

        if (widthSum < frame.size.width) {
            CGFloat newWid = frame.size.width / _gyx_arr.count;
            
            for (GYX_Item *b in self.gyxScrollView.subviews) {
                NSInteger idx = b.tag - 100;
                if ([b isKindOfClass:[GYX_Item class]]) {
                    b.frame = CGRectMake(idx * newWid, 0, newWid, GYX_ITEM_HEIGHT);
                }
                
            }
            widthSum = frame.size.width;
        }
        self.gyxScrollView.contentSize = CGSizeMake(widthSum, 0);
        
        self.lineView = [[UIView alloc] init];
        [self.gyxScrollView addSubview:self.lineView];
        self.lineView.backgroundColor = LineColor;
        GYX_Item *item = [self viewWithTag:100];
        self.lineView.frame = CGRectMake(0, GYX_ITEM_HEIGHT, item.frame.size.width, LINE_HEIGHT);
        
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
        [self addSubview:self.topView];
        self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, GYX_ITEM_HEIGHT, widthSum, 1)];
        [self.gyxScrollView addSubview:self.bottomView];
        
        
        self.gyxBottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, GYX_SEG_HEIGHT, frame.size.width, frame.size.height - GYX_SEG_HEIGHT)];
        self.gyxBottomScrollView.delegate = self;
        self.gyxBottomScrollView.pagingEnabled = YES;
        [self addSubview:self.gyxBottomScrollView];
        self.gyxBottomScrollView.contentSize = CGSizeMake(frame.size.width * _gyx_arr.count, 0);
        
        for (GYX_Item *item in self.gyxScrollView.subviews) {
            if ([item isKindOfClass:[GYX_Item class]]) {
                if (item.tag == 100) {
                    if (self.isChangeSelectColor) {
                        
                        if (self.selColorStr) {
                            [item.itemBtn setTitleColor:[UIColor colorFromHexCode:self.selColorStr] forState:UIControlStateNormal];
                        } else if (self.selectColor) {
                            [item.itemBtn setTitleColor:self.selectColor forState:UIControlStateNormal];
                        } else {
                            [item.itemBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                        }
                    }
                }
            }
        }
        
        
    }
    return self;
}
- (void)doTap:(UIButton *)sender{
    _selectIndex = sender.tag - 1000;
    GYX_Item *item = [self.gyxScrollView viewWithTag:_selectIndex + 100];
    NSLog(@"%lf", item.frame.origin.x);
    [UIView animateWithDuration:.5 animations:^{
        self.lineView.frame = CGRectMake(item.frame.origin.x, GYX_ITEM_HEIGHT, item.frame.size.width, LINE_HEIGHT);
        self.gyxBottomScrollView.contentOffset = CGPointMake(_selectIndex * self.frame.size.width, 0);
        if (item.frame.origin.x > self.frame.size.width / 2 && self.gyxScrollView.contentSize.width - item.frame.origin.x > self.frame.size.width / 2) {
            self.gyxScrollView.contentOffset = CGPointMake(item.frame.origin.x - self.frame.size.width / 2, 0);
        } else if( self.gyxScrollView.contentSize.width - item.frame.origin.x < self.frame.size.width / 2){
            self.gyxScrollView.contentOffset = CGPointMake(self.gyxScrollView.contentSize.width - self.frame.size.width, 0);
        }  else if(item.frame.origin.x < self.frame.size.width / 2){
            self.gyxScrollView.contentOffset = CGPointMake(0, 0);
        }
    }];
    
    
    if (self.isChangeSelectColor) {
        
        if (self.selColorStr) {
            [sender setTitleColor:[UIColor colorFromHexCode:self.selColorStr] forState:UIControlStateNormal];
        } else if (self.selectColor) {
            [sender setTitleColor:self.selectColor forState:UIControlStateNormal];
        } else {
            [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        
        for (GYX_Item *item in self.gyxScrollView.subviews) {
            if ([item isKindOfClass:[GYX_Item class]]) {
                if (item.tag - 100 == _selectIndex) {
                    
                } else {
                    [item.itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
            }
        }
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.gyxBottomScrollView) {
        NSInteger idx = self.gyxBottomScrollView.contentOffset.x / self.frame.size.width;
        NSLog(@"%ld", idx);
        GYX_Item *item = [self.gyxScrollView viewWithTag:idx + 100];
        [UIView animateWithDuration:.5 animations:^{
           self.lineView.frame = CGRectMake(item.frame.origin.x, GYX_ITEM_HEIGHT, item.frame.size.width, LINE_HEIGHT);
        }];


    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
    if (scrollView == self.gyxBottomScrollView) {
        NSInteger idx = self.gyxBottomScrollView.contentOffset.x / self.frame.size.width;
        self.selectIndex = idx;
        GYX_Item *item = [self.gyxScrollView viewWithTag:idx + 100];
        [UIView animateWithDuration:.5 animations:^{
            self.lineView.frame = CGRectMake(item.frame.origin.x, GYX_ITEM_HEIGHT, item.frame.size.width, LINE_HEIGHT);
            if (item.frame.origin.x > self.frame.size.width / 2 && self.gyxScrollView.contentSize.width - item.frame.origin.x > self.frame.size.width / 2) {
                self.gyxScrollView.contentOffset = CGPointMake(item.frame.origin.x - self.frame.size.width / 2, 0);
            } else if( self.gyxScrollView.contentSize.width - item.frame.origin.x < self.frame.size.width / 2){
                self.gyxScrollView.contentOffset = CGPointMake(self.gyxScrollView.contentSize.width - self.frame.size.width, 0);
            }  else if(item.frame.origin.x < self.frame.size.width / 2){
                self.gyxScrollView.contentOffset = CGPointMake(0, 0);
            }
        }];
        if (self.isChangeSelectColor) {
            
            
            for (GYX_Item *it in self.gyxScrollView.subviews) {
                if ([it isKindOfClass:[GYX_Item class]]) {
                    if (it.tag == item.tag) {
                        if (self.selColorStr) {
                            [it.itemBtn setTitleColor:[UIColor colorFromHexCode:self.selColorStr] forState:UIControlStateNormal];
                        } else if (self.selectColor) {
                            [it.itemBtn setTitleColor:self.selectColor forState:UIControlStateNormal];
                        } else {
                            [it.itemBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                        }
                    } else {
                        [it.itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                        
                    }
                }
            }
        }
        
    }

}
- (void)changeSelectIndex:(NSInteger)index {
    _selectIndex = index;
    
    
}

- (void)setViewArr:(NSMutableArray *)viewArr {
    _viewArr = viewArr;
    if (_viewArr.count == _gyx_arr.count) {
        for (NSInteger i = 0; i < viewArr.count; i++) {
            UIView *viewS = _viewArr[i];
            viewS.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height - GYX_SEG_HEIGHT);
            [self.gyxBottomScrollView addSubview:viewS];
        }
    }
    
}
- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
- (void)setTopViewBackgroundColor:(UIColor *)color {
    self.topView.backgroundColor = color;
}
- (void)setBottomViewBackgroundColor:(UIColor *)color {
    self.bottomView.backgroundColor = color;
}
- (void)setLineViewBackgroundColor:(UIColor *)color {
    self.lineView.backgroundColor = color;
}



- (void)setselColor:(UIColor *)color {
    _selectColor = color;
    if (self.isChangeSelectColor) {
        for (GYX_Item *it in self.gyxScrollView.subviews) {
            if ([it isKindOfClass:[GYX_Item class]]) {
                if (it.tag == 100) {
                        [it.itemBtn setTitleColor:color forState:UIControlStateNormal];
                }
            }
        }

    }
    
}
- (void)setselColorStr:(NSString *)colorStr {
    _selColorStr = colorStr;
    if (self.isChangeSelectColor) {
        
        for (GYX_Item *it in self.gyxScrollView.subviews) {
            if ([it isKindOfClass:[GYX_Item class]]) {
                if (it.tag == 100) {
                    [it.itemBtn setTitleColor:[UIColor colorFromHexCode:self.selColorStr] forState:UIControlStateNormal];
                }
            }
        }
    }
    
}
- (void)setBetweenItemViewBackgroundColor:(UIColor *)color {
    if (self.isChangeSelectColor) {
        
        for (GYX_Item *it in self.gyxScrollView.subviews) {
            if ([it isKindOfClass:[GYX_Item class]]) {
                it.betweenItemView.backgroundColor = color;
                if (it.tag == _gyx_arr.count - 1 + 100 ) {
                    it.betweenItemView.alpha = 0;
                }
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation GYX_Item
- (instancetype)init {
    self = [super init];
    if (self) {
        self.itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.itemBtn];
        
        self.topView = [[UIView alloc] init];
        [self addSubview:self.topView];
        
        self.bottomView = [[UIView alloc] init];
        [self addSubview:self.bottomView];
        
        self.frontView = [[UIView alloc] init];
        [self addSubview:self.frontView];
        
        self.behindView = [[UIView alloc] init];
        [self addSubview:self.behindView];
        
        self.betweenItemView = [[UIView alloc] init];
        [self addSubview:self.betweenItemView];
        
    }
    return self;
    
}
- (void)layoutSubviews {
    CGFloat widthItem = self.frame.size.width;
    CGFloat heightItem = self.frame.size.height;
    
    self.itemBtn.frame = CGRectMake(ITEM_OtherView_WidOrHei, ITEM_OtherView_WidOrHei, widthItem - 2 * ITEM_OtherView_WidOrHei - 1, heightItem - 2 * ITEM_OtherView_WidOrHei);
    self.topView.frame = CGRectMake(0, 0, widthItem, ITEM_OtherView_WidOrHei);
    self.bottomView.frame = CGRectMake(0, heightItem - ITEM_OtherView_WidOrHei, widthItem, ITEM_OtherView_WidOrHei);
    self.frontView.frame = CGRectMake(0, 0, ITEM_OtherView_WidOrHei, heightItem);
    self.behindView.frame = CGRectMake(widthItem - ITEM_OtherView_WidOrHei- 1, 0, ITEM_OtherView_WidOrHei, heightItem);
    self.betweenItemView.frame = CGRectMake(widthItem - 1, 0, 1, heightItem);
    
    
}


@end

