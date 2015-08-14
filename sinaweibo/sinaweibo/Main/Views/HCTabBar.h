//
//  HCTabBar.h
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HCTabBar;
@protocol HCTabBarDelegate <NSObject,UITabBarDelegate>

-(void)tabBar:(HCTabBar *)tabBar didClickButton:(UIButton *)button;

@end
@interface HCTabBar : UITabBar
@property (nonatomic,weak) id<HCTabBarDelegate>delegate;
@end
