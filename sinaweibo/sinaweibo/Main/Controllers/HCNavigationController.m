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
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed=YES;
        UIViewController *controller=self.viewControllers.lastObject;
        viewController.navigationItem.backBarButtonItem.title=controller.title;
    }
    [super pushViewController:viewController animated:animated];
}
@end
