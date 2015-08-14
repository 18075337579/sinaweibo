//
//  HomeButton.m
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HomeButton.h"

@implementation HomeButton
//调整文字和图片的位置
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.X=0;
    self.imageView.X=CGRectGetMaxX(self.titleLabel.frame);
}
@end
