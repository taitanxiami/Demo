//
//  GHDetailViewController.m
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "GHDetailViewController.h"

@interface GHDetailViewController ()

@property (nonatomic, weak) UIImageView *detailIcon;
@property (nonatomic, weak) UIImageView *leftBarIcon;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation GHDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *wrapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftBarButtonClick)];
    [wrapView addGestureRecognizer:tap];
    
    UIImageView *leftBarIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hamburger"]];
    self.leftBarIcon = leftBarIcon;
    
    [wrapView addSubview:leftBarIcon];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:wrapView];

}

- (void)leftBarButtonClick {
    if (self.leftBarButtonDidClick) {
        
        self.leftBarButtonDidClick();
    }
}

- (void)rotateLeftBarButtonWithScale:(CGFloat)scale {
    
    //scale 是弧度
    CGFloat angle = M_PI_2 * (1 - scale);
    
//    NSLog(@"%f",angle);
    //CGAffineTransformMakeRotation 返回一个transform 用于旋转
    self.leftBarIcon.transform = CGAffineTransformMakeRotation(angle);
}


//set 方法
-(void)setModel:(GHMenuItemModel *)model {
    
    UIImage *bigImage = [UIImage imageNamed:model.bigImage];
    self.imageView.image = bigImage;
    self.imageView.bounds = CGRectMake(0, 0, bigImage.size.width, bigImage.size.height);
    self.view.backgroundColor = [UIColor colorWithRed:[model.colors[0] doubleValue]/255.0 green:[model.colors[1] doubleValue]/255.0 blue:[model.colors[2] doubleValue]/255.0 alpha:1.0];
}

-(UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _imageView.center = self.view.center;
        [self.view addSubview:_imageView];
    }
    
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
