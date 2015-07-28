//
//  GHMenuViewController.h
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHMenuItemModel.h"
@interface GHMenuViewController : UITableViewController

@property (nonatomic, copy) void(^menuDidClick)(GHMenuItemModel *item, BOOL animated);

@end
