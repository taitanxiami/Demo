//
//  GHMenuViewController.m
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "GHMenuViewController.h"
#import "GHMenuCell.h"

static NSString *const identifier = @"cell";
@interface GHMenuViewController ()
@property (nonatomic, copy) NSArray *menuItems;

@end

@implementation GHMenuViewController


/**
 *  @return 数据源(懒加载)
 */
- (NSArray *)menuItems {
    
    if (!_menuItems) {
        
        _menuItems = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"]];
        
        NSMutableArray *array = @[].mutableCopy;
        for (NSDictionary *dict in _menuItems) {
            GHMenuItemModel *item = [GHMenuItemModel itemWithDic:dict];
            [array addObject:item];
        }
        _menuItems = array.copy;
    }
    return _menuItems;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GHMenuCell class] forCellReuseIdentifier:identifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
    self.menuDidClick(self.menuItems[0],NO);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GHMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.model = self.menuItems[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return MAX(80, CGRectGetHeight(self.tableView.bounds) / self.menuItems.count);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.menuDidClick(self.menuItems[indexPath.row],YES);
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
