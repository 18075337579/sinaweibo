//
//  HCTem2Controller.m
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCTem2Controller.h"
#import "HCTem3Controller.h"

@implementation HCTem2Controller
-(void)viewDidLoad{
    self.title=@"HCTem2Controller";
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    HCTem3Controller *tem3Contr=[[HCTem3Controller alloc] init];
    [self.navigationController pushViewController:tem3Contr animated:YES];
}
@end
