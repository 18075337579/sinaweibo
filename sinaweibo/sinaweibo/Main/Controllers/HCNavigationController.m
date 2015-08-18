//
//  HCNavigationController.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCNavigationController.h"

@interface HCNavigationController ()

@end

@implementation HCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //默认返回按钮的title
    NSString *title=@"返回";
    if (self.childViewControllers.count >=1) {
        //表示有一个子控制器,准备push第二个子控制器,设置返回按钮的文字为第一个控制器的title,
        if (self.childViewControllers.count == 1) {
            //设置返回按钮的文字
            title=[self.childViewControllers.firstObject title];
            
        }
        //设置即将被push控制器的返回按钮(自定义的BarButtonItem)
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back_withtext" andTitele:title andTarget:self andAction:@selector(back)];
        //从push第二个控制器起都要隐藏底部的tabBar
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    //返回到上一个控制器
    [self popViewControllerAnimated:YES];
}
@end
