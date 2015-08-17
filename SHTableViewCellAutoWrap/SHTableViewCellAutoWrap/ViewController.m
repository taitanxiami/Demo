//
//  ViewController.m
//  SHTableViewCellAutoWrap
//
//  Created by apple on 15/8/17.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

static NSString *const cellIdentify = @"cellIdentify";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr  = @[@"hello,world! hello,world! hello,world! hello,world! hello,world! hello,world!",@" hello,world! hello,world! hello,world!",@" hello,world! hello,world!",@" hello,world!",@" hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world! hello,world!"];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;

    [self.view addSubview:self.tableView];    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentify];
}
#pragma mark - table view data sorce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil] lastObject];
    }
    cell.contentLabel.text = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:cellIdentify configuration:^(id cell) {
                CustomCell *cells = cell;
                cells.contentLabel.text = self.dataArr[indexPath.row];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
