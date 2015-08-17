//
//  ViewController.m
//  UIScrollViewLoopviewDemo
//
//  Created by apple on 15/8/6.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "ViewController.h"
#import "ImageScrollView.h"
@interface ViewController ()

@property (strong, nonatomic)  ImageScrollView *loopView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"http://pic15.nipic.com/20110630/7862725_131816557150_2.jpg",
                     @"http://photos.tuchong.com/15432/f/826097.jpg",@"http://pic15.nipic.com/20110630/7862725_131816557150_2.jpg",
                     @"http://photos.tuchong.com/15432/f/826097.jpg"];
    
    ImageScrollView *loopview = [[ImageScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) ImageArray:arr];
    
    [loopview setImageArray:arr];
    [self.view addSubview:loopview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
