//
//  HCTabBarController.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCTabBarController.h"
#import "HCHomeController.h"
#import "HCMessageController.h"
#import "HCDiscoveryController.h"
#import "HCMeController.h"
#import "HCTabBar.h"

@interface HCTabBarController ()<HCTabBarDelegate>

@end

@implementation HCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建自定义tabBar
    HCTabBar *tabBar=[[HCTabBar alloc] init];
    //设置自定义tabBar的代理
    tabBar.delegate=self;

    //由于tabBar属性为只读属性,不能直接赋值,需要通过kvc实现
    [self setValue:tabBar forKeyPath:@"self.tabBar"];
    
    //设置view的背景颜色
    self.view.backgroundColor = [UIColor brownColor];
    //设置文字的颜色
    self.tabBar.tintColor=[UIColor orangeColor];
    //添加子控制器同时设置tabbar的图片和标题
    [self addSubControllers];
    

}

//添加子控制器
- (void)addSubControllers
{
    HCHomeController* home = [[HCHomeController alloc] initWithRootViewController:[UITableViewController new]];
    [self setTabBarWith:home andTitle:@"首页" andImageName:@"home"];

    HCMessageController* message = [[HCMessageController alloc] initWithRootViewController:[UITableViewController new]];
    [self setTabBarWith:message andTitle:@"消息" andImageName:@"message_center"];
    
    HCDiscoveryController* discovery = [[HCDiscoveryController alloc] initWithRootViewController:[UITableViewController new]];
    [self setTabBarWith:discovery andTitle:@"发现" andImageName:@"discover"];

    HCMeController* me = [[HCMeController alloc] initWithRootViewController:[UITableViewController new]];
    [self setTabBarWith:me andTitle:@"我" andImageName:@"profile"];
}

//设置tabbar的标题和图片
- (void)setTabBarWith:(UIViewController*)controller andTitle:(NSString*)titleName andImageName:(NSString*)imageName
{
    //设置标题
    controller.tabBarItem.title = titleName;
    NSString* normalImgName = [NSString stringWithFormat:@"tabbar_%@", imageName];
    NSString* selectImgName = [NSString stringWithFormat:@"tabbar_%@_selected", imageName];
    //设置正常状态下的图片
    controller.tabBarItem.image = [[UIImage imageNamed:normalImgName] originalImage];
    //设置选中状态下的图片
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImgName] originalImage];
    //添加自控制器
    [self addChildViewController:controller];
}

//实现tabBar的代理方法
-(void)tabBar:(HCTabBar *)tabBar didClickButton:(UIButton *)button{
    NSLog(@"%s",__func__);
}
@end
