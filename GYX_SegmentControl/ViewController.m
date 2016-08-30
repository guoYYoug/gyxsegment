//
//  ViewController.m
//  GYX_SegmentControl
//
//  Created by DLAB on 16/7/1.
//  Copyright © 2016年 DLAB. All rights reserved.
//

#import "ViewController.h"
#import "GYX_SegmentCon/GYX_SegmentControl.h"
#import "TableViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *vid = [[UIView alloc] init];
    vid.backgroundColor = [UIColor purpleColor];
    
    UIView *vid1 = [[UIView alloc] init];
    vid1.backgroundColor = [UIColor orangeColor];
    
    UIView *vid2 = [[UIView alloc] init];
    vid2.backgroundColor = [UIColor redColor];
    
    UIView *vid3 = [[UIView alloc] init];
    vid3.backgroundColor = [UIColor purpleColor];
    
    UIView *vid4 = [[UIView alloc] init];
    vid4.backgroundColor = [UIColor orangeColor];
    
    UIView *vid5 = [[UIView alloc] init];
    vid5.backgroundColor = [UIColor redColor];
    
    
    UIView *vid6 = [[UIView alloc] init];
    vid6.backgroundColor = [UIColor purpleColor];
    
    UIView *vid7 = [[UIView alloc] init];
    vid7.backgroundColor = [UIColor purpleColor];
    
    NSArray *arr = @[vid,vid1,vid2, vid3, vid4, vid5, vid6, vid7];
    NSMutableArray *arrView = [NSMutableArray array];
    NSArray *arrlist = @[@"开的封", @"反的住宿费反", @"健的身", @"打的开", @"提的高", @"咯的额", @"突的然", @"让的人"];
    for (NSInteger i = 0; i < arrlist.count; i++) {
        TableViewController *tableC = [[TableViewController alloc] init];
        tableC.idx = i;
        tableC.owner = self;
        [arrView addObject:tableC];
        NSLog(@"%ld", i);
    }
    
    GYX_SegmentControl *control = [[GYX_SegmentControl alloc] initWithFrame:CGRectMake(0, 80, Screen_Width, 300) segCount:arrlist isChangeColor:YES];
    control.viewArr = arrView;//[NSMutableArray arrayWithArray:arr];可以是view数组或者viewcontroller数组,且数量必须与segCount相同
    [control setselColor:[UIColor orangeColor]];
    [control setLineViewBackgroundColor:[UIColor orangeColor]];
    //[control setTopViewBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:control];
    //[control setBetweenItemViewBackgroundColor:[UIColor blackColor]];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
