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

@end
