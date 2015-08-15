//
//  HCDiscoverSearch.m
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCDiscoverSearch.h"
@interface HCDiscoverSearch()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchFieldView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstraint;
@end
@implementation HCDiscoverSearch

+(instancetype)discoverSearch{
    HCDiscoverSearch *search=[[NSBundle mainBundle] loadNibNamed:@"DiscoverySearch" owner:nil options:nil].lastObject;
    return search;
}

//从xib中加载控件时调用,(此时连线已经完成)
-(void)awakeFromNib{
    UIImageView *left=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    //设置textfied的代理
    self.searchFieldView.delegate=self;
    self.searchFieldView.leftView=left;
    
    //让图片居中显示
    left.W=35;
    left.contentMode=UIViewContentModeCenter;
    
    //设置textField的边框
    self.searchFieldView.layer.borderWidth=1.5;
    self.searchFieldView.layer.cornerRadius=5;
    self.searchFieldView.layer.masksToBounds=YES;
    //设置leftView模式
    self.searchFieldView.leftViewMode=UITextFieldViewModeAlways;
    self.searchFieldView.leftView.X=100;
}
- (IBAction)cancleBtnClick:(id)sender {
    self.rightConstraint.constant=0;
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
    }];
    //释放第一响应者
    [self endEditing:YES];
}

//textfield的代理方法
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField becomeFirstResponder];
    //修改约束
    self.rightConstraint.constant=60;
    //添加动画
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
