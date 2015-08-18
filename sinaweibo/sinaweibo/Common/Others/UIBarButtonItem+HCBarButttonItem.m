//
//  UIBarButtonItem+HCBarButttonItem.m
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "UIBarButtonItem+HCBarButttonItem.h"

@implementation UIBarButtonItem (HCBarButttonItem)
+(instancetype)barButtonItemWithImageName:(NSString *)imageName andTarget:(id)target andAction:(SEL)action{
    UIButton *button=[[UIButton alloc] init];
    NSString *highlightImgName=[NSString stringWithFormat:@"%@_highlighted",imageName];
    
    [button setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.Size=button.currentImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+(instancetype)barButtonItemWithImageName:(NSString *)imageName andTitele:(NSString *)title andTarget:(id)target andAction:(SEL)action{
    UIButton *backBtn=[[UIButton alloc] init];
    //设置图片
    NSString *highlightImgName=[NSString stringWithFormat:@"%@_highlighted",imageName];
    [backBtn setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    [backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置文字
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}


@end
