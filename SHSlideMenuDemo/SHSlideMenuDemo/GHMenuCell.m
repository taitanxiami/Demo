//
//  GHMenuCell.m
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "GHMenuCell.h"
@interface GHMenuCell ()

@property (nonatomic, weak) UIImageView *menuIcon;

@end
@implementation GHMenuCell

- (void)awakeFromNib {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *menuIcon = [[UIImageView alloc] init];
        self.menuIcon = menuIcon;
        [self addSubview:menuIcon];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.menuIcon.frame = self.bounds;
    self.menuIcon.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setModel:(GHMenuItemModel *)model {
    _model = model;
    self.menuIcon.image = [UIImage imageNamed:model.image];
    CGFloat r = [model.colors[0] doubleValue] / 255.0;
    CGFloat g = [model.colors[1] doubleValue] / 255.0;
    CGFloat b = [model.colors[2] doubleValue] / 255.0;
    self.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}


@end
