//
//  TableViewController.h
//  GYX_SegmentControl
//
//  Created by DLAB on 16/8/25.
//  Copyright © 2016年 DLAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UIViewController *owner;
@end
