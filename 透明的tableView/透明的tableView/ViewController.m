//
//  ViewController.m
//  透明的tableView
//
//  Created by taitanxiami on 15/9/24.
//  Copyright (c) 2015年 taitanxiami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    //设置导航栏透明
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UIColor* tableBackgroundColor = [UIColor blueColor];
//    tableBackgroundColor = [tableBackgroundColor colorWithAlphaComponent:0.5];
//    [self.tableView setBackgroundColor:tableBackgroundColor];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.view.layer.contents = (__bridge id) [UIImage imageNamed:@"bg_night_rain.jpg"].CGImage;
    self.view.layer.contentsGravity = kCAGravityResizeAspectFill;
    
//    //设置导航栏透明
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showDetail)];
    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showDetail)];
    self.navigationItem.leftBarButtonItem = leftitem;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"hello,world!";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    

    return cell;
    
    
}


@end
