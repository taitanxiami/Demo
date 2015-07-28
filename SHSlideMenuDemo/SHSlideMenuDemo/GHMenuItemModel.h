//
//  GHMenuItemModel.h
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHMenuItemModel : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *bigImage;

@property (nonatomic, copy) NSArray *colors;
+ (instancetype)itemWithDic:(NSDictionary *)dic;
@end
