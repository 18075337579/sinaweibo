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
    self.imageView.X=CGRectGetMaxX(self.titleLabel.frame) + 5;
    //设置按钮的宽度
    self.W=self.titleLabel.W + self.imageView.W + 5;
    //让按钮在父控件中水平居中
    self.centerX = self.superview.W * 0.5;
}
//设置按钮的title时,修改按钮的大小(调用layoutSubViews方法实现)
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}
//设置按钮的image时,修改按钮的大小(调用layoutSubViews方法实现)
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
