//
//  GHMainViewController.m
//  SHSlideMenuDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "GHMainViewController.h"
#import "GHDetailViewController.h"
#import "GHMenuViewController.h"

static const CGFloat MenuWidth = 80;
@interface GHMainViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,weak) GHMenuViewController *menuVC;
@property (nonatomic,weak) GHDetailViewController *detailVC;

@property (nonatomic, getter=isShowMenu) BOOL showMenu;

@end

@implementation GHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configScrollView];
    [self configChildViewController];
    [self configChildiew];
}

#pragma mark - config control
-(void)configScrollView {
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds)+MenuWidth, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.scrollView];
}

-(void)configChildViewController {
    
    
    GHDetailViewController *detailVC = [[GHDetailViewController alloc]init];
    self.detailVC = detailVC;
    
    detailVC.view.backgroundColor = [UIColor greenColor];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detailVC];
    [self addChildViewController:nav];

    GHMenuViewController *menuVC = [[GHMenuViewController alloc]initWithStyle:UITableViewStylePlain];
    menuVC.menuDidClick = ^(GHMenuItemModel *model,BOOL animated ){
        
        detailVC.model = model;
        [self showOrHideMenu:NO animated:animated];
        
    };

    self.menuVC = menuVC;
    menuVC.view.backgroundColor = [UIColor redColor];
    UINavigationController *menuNav = [[UINavigationController alloc]initWithRootViewController:menuVC];
    [self addChildViewController:menuNav];
    
    
    nav.navigationBar.barStyle = UIBarStyleBlack;
    nav.navigationBar.translucent = NO;
    nav.navigationBar.clipsToBounds = YES;
    
    menuNav.navigationBar.barStyle = UIBarStyleBlack;
    menuNav.navigationBar.translucent = NO;
    menuNav.navigationBar.clipsToBounds = YES;
    
    
       detailVC.leftBarButtonDidClick = ^{
    
        [self showOrHideMenu:!_showMenu animated:YES];
    };
}
-(void)configChildiew {
    
    //配置显示的view
    self.menuVC.parentViewController.view.frame = CGRectMake(0, 0, MenuWidth, CGRectGetHeight(self.scrollView.bounds));
    [self.scrollView addSubview:self.menuVC.parentViewController.view];
    
    self.detailVC.parentViewController.view.frame = CGRectMake(MenuWidth, 0, CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
    [self.scrollView addSubview:self.detailVC.parentViewController.view];
    
    // 为菜单视图的旋转设置锚点
    
    NSLog(@"%@",NSStringFromCGPoint(self.menuVC.view.layer.anchorPoint));
    
    //默认是（0.5，0.5）
    self.menuVC.view.layer.anchorPoint = CGPointMake(1, 0.5);

    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 解决菜单隐藏后点击detailView会自动显示菜单的bug，bug原因与pagingEnabled有关，还没太弄清楚，感兴趣的同学可自行查看
    // http://stackoverflow.com/questions/4480512/uiscrollview-single-tap-scrolls-it-to-top
    scrollView.pagingEnabled = scrollView.contentOffset.x < MenuWidth;
    
    // 控制菜单显示与否的状态
    self.showMenu = scrollView.contentOffset.x < MenuWidth;
    
    //scale 0-1
    CGFloat scale = scrollView.contentOffset.x / MenuWidth;
    
    // 菜单视图的翻页效果
    self.menuVC.view.layer.transform = [self transformWithScale:scale];
    self.menuVC.view.alpha = 1 - scale;
    
    // 顶部按钮的滚动效果
    [self.detailVC rotateLeftBarButtonWithScale:scale];
}

- (void)showOrHideMenu:(BOOL)showOrHide animated:(BOOL)animated {
    [self.scrollView setContentOffset:showOrHide ? CGPointZero : CGPointMake(MenuWidth, 0) animated:animated];
}

// 菜单视图的翻页效果
- (CATransform3D)transformWithScale:(CGFloat)scale {
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 1000.0; // 3D效果
    CGFloat angle = -M_PI_2 * scale;
    CATransform3D rotation = CATransform3DRotate(transform, angle, 0, 1, 0);
    return rotation;
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
