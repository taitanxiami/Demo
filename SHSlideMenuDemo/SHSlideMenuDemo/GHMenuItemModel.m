//
//  GHMenuItemModel.m
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "GHMenuItemModel.h"

@implementation GHMenuItemModel

+ (instancetype)itemWithDic:(NSDictionary *)dic {
    
    GHMenuItemModel *model = [[GHMenuItemModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end
