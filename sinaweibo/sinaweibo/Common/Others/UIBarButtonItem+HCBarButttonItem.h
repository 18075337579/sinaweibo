//
//  UIBarButtonItem+HCBarButttonItem.h
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HCBarButttonItem)
//返回不带文字的按钮
+(instancetype)barButtonItemWithImageName:(NSString *)imageName andTarget:(id)target andAction:(SEL)action;

//返回带文字的按钮
+(instancetype)barButtonItemWithImageName:(NSString *)imageName andTitele:(NSString *)title andTarget:(id)target andAction:(SEL)action;
@end
