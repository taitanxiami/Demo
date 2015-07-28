//
//  GHDetailViewController.h
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHMenuItemModel.h"
@interface GHDetailViewController : UIViewController

@property (nonatomic,strong) GHMenuItemModel *model;
@property (nonatomic, copy) void(^leftBarButtonDidClick)();

- (void)rotateLeftBarButtonWithScale:(CGFloat)scale ;
@end
