//
//  TableViewController.m
//  GYX_SegmentControl
//
//  Created by DLAB on 16/8/25.
//  Copyright © 2016年 DLAB. All rights reserved.
//

#import "TableViewController.h"
#import "ddViewController.h"


@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.rowHeight = 50;
    [self.view addSubview:_table];
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.view.backgroundColor = [UIColor purpleColor];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (self.idx == 0) {
       cell.textLabel.text = @"方法反反复复凤飞飞";
    } else if (self.idx == 1) {
        cell.textLabel.text = @"嘎嘎嘎嘎嘎嘎";
    } else if (self.idx == 2) {
        cell.textLabel.text = @"将军金甲夜不脱";
    } else if (self.idx == 3) {
        cell.textLabel.text = @"啪啪啪啪啪啪";
    } else if (self.idx == 4) {
        cell.textLabel.text = @"么么么么么么么";
    } else if (self.idx == 5) {
        cell.textLabel.text = @"喵喵喵喵密密麻麻";
    } else if (self.idx == 6) {
        cell.textLabel.text = @"96666666";
    } else if (self.idx == 7) {
        cell.textLabel.text = @"哪里哪里哪里呢";
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"123");
    ddViewController *con = [[ddViewController alloc] init];
    [self.owner.navigationController pushViewController:con animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
