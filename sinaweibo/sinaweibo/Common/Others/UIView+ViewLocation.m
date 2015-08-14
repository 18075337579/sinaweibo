//
//  UIView+ViewLocation.m
//  HCLottery
//
//  Created by huchao on 15/7/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "UIView+ViewLocation.h"

@implementation UIView (ViewLocation)
-(double)X{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)X{
    CGRect rect=self.frame;
    rect.origin.x=X;
    self.frame=rect;
}
-(double)Y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)Y{
    CGRect rect=self.frame;
    rect.origin.y=Y;
    self.frame=rect;
}
-(double)W{
    return self.frame.size.width;
}
-(void)setW:(CGFloat)W{
    CGRect rect=self.frame;
    rect.size.width=W;
    self.frame=rect;
}
-(double)H{
    return self.frame.size.height;
}
-(void)setH:(CGFloat)H{
    CGRect rect=self.frame;
    rect.size.height=H;
    self.frame=rect;
}

-(void)setCenterX:(double)centerX{
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;
}
-(double)centerX{
    return self.center.x;
}

-(void)setCenterY:(double)centerY{
    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;
}
-(double)centerY{
    return self.center.y;
}

-(void)setSize:(CGSize)Size{
    CGRect rect=self.frame;
    rect.size=Size;
    self.frame=rect;
}

-(CGSize)Size{
    return self.frame.size;
}


@end
