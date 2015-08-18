//
//  AppDelegate.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "AppDelegate.h"
#import "HCTabBarController.h"
#import "HCGuideController.h"
#import "HCLogInController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建窗口
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置窗口的根控制器
//    [self choseController];
    self.window.rootViewController=[HCLogInController new];
    //让窗口显示
    [self.window makeKeyAndVisible];
    return YES;
}

//根据当前版本号选择跳转的控制器
-(void)choseController{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    
    //获取应用当前版本号
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //判断当前版本号与保存的版本号是否相同
    NSString *saveVersion=[user objectForKey:@"saveVersion"];
    //如果不相同(包括第一次打开应用
    if ([saveVersion isEqualToString:currentVersion]) {
        //跳转到新特性控制器
        HCGuideController *guideController=[[HCGuideController alloc] init];
        self.window.rootViewController=guideController;
    }
    else {
        //跳转到主控制器
        //创建自定义tabBarController
        HCTabBarController *tabBarController=[[HCTabBarController alloc] init];
        //设置窗口的根控制器
        self.window.rootViewController=tabBarController;
        
    }
    //保存版本号
    [user setValue:currentVersion forKey:@"saveVersion"];
    [user synchronize];
    
}

@end
