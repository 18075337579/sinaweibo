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

@interface HCTabBarController ()

@end

@implementation HCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建子控制器
    [self addSubControllers];
    self.view.backgroundColor = [UIColor brownColor];
}

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

- (void)setTabBarWith:(UIViewController*)controller andTitle:(NSString*)titleName andImageName:(NSString*)imageName
{
    //设置标题
    controller.tabBarItem.title = titleName;
    
    NSString* normalImgName = [NSString stringWithFormat:@"tabbar_%@", imageName];
    NSString* selectImgName = [NSString stringWithFormat:@"tabbar_%@_selected", imageName];
    //
    controller.tabBarItem.image = [[UIImage imageNamed:normalImgName] originalImage];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImgName] originalImage];
    [self addChildViewController:controller];
}

@end
