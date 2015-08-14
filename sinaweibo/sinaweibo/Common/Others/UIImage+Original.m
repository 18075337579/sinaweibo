//
//  UIImage+Original.m
//  HCLottery
//
//  Created by huchao on 15/7/16.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)
-(UIImage *)originalImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
