//
//  HCTabBar.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCTabBar.h"

@implementation HCTabBar

@dynamic delegate;
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        //添加按钮
        UIButton* btn = [[UIButton alloc] init];
        [self addSubview:btn];
        //设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //设置小图片
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        //添加点击事件
        [btn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

//布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    double width=kScreenWidth * 1.0 / 5;
    NSMutableArray *mutArr=[NSMutableArray array];
    UIButton *button=nil;
    //获取UITabBarButton(系统私有的类)
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [mutArr addObject:view];
        }
        if ([view isKindOfClass:[UIButton class]]) {
            button=(UIButton *)view;
            //设置按钮的位置
            view.centerX=self.W * 0.5;
            view.centerY=self.H * 0.5;
        }
    }
    
    //设置子控件的位置
    for (int i=0; i<mutArr.count; i++) {
        UIView *view=mutArr[i];
        view.X=i * width;
        view.W=width;
        if (i >1) {
            view.X=(i + 1) * width;
        }
    }

}

-(void)addBtnClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [self.delegate tabBar:self didClickButton:button];
    }
}
@end
