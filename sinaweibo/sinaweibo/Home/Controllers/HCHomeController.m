//
//  HCHomeController.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCHomeController.h"
#import "HomeButton.h"

@interface HCHomeController ()

@end

@implementation HCHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBar];
}

- (void)didReceiveMemoryWarning
{
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

//设置导航栏
- (void)setNavigationBar
{
    //设置导航条的leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_friendsearch" andTarget:self andAction:@selector(leftBtnClick)];

    //设置导航条的rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_pop" andTarget:self andAction:@selector(rightBtnClick)];

    //设置中间的titleView
    HomeButton* button = [[HomeButton alloc] init];
    [button setTitle:@"我是首页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [button sizeToFit];

    //添加按钮的点击事件
    [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

- (void)leftBtnClick
{
    NSLog(@"%s", __func__);
}

- (void)rightBtnClick
{
    NSLog(@"%s", __func__);
}

//titleView按钮的点击事件
- (void)titleButtonClick:(UIButton*)button
{
    //添加蒙版按钮(透明)
    UIButton* cover = [[UIButton alloc] init];
    cover.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    //将蒙版添加到主窗口上
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    cover.backgroundColor = [UIColor clearColor];
    //创建图片框(用来显示图片)
    UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover_background"]];
    imgView.W = 100;
    imgView.H = 100;
    //让图片框可以和用户交互(点击图片框时,事件不会传递给cover)
    imgView.userInteractionEnabled=YES;
    //将titleView的frame转化为在父控件中的frame
    CGRect rect = [button.superview convertRect:button.frame toView:nil];
    imgView.centerX = CGRectGetMidX(rect);
    imgView.Y = CGRectGetMaxY(rect);

    //创建红色的view
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(8,14,85, 75);
    [imgView addSubview:view];
    [cover addSubview:imgView];

    //添加点击事件
    [cover addTarget:self action:@selector(coverButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

//蒙版按钮点击事件
- (void)coverButtonClick:(UIButton*)button
{
    //移除蒙版
    [button removeFromSuperview];
}
@end
