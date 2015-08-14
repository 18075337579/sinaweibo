//
//  UIBarButtonItem+HCBarButttonItem.h
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HCBarButttonItem)
+(instancetype)barButtonItemWithImageName:(NSString *)imageName andTarget:(id)target andAction:(SEL)action ;
@end
