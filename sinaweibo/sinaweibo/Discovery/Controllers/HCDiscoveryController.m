//
//  HCDiscoveryController.m
//  sinaweibo
//
//  Created by huchao on 15/8/14.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCDiscoveryController.h"
#import "HCDiscoverSearch.h"

@interface HCDiscoveryController ()

@end

@implementation HCDiscoveryController

- (void)viewDidLoad {
    [super viewDidLoad];
    //从xib中加载搜索框
    HCDiscoverSearch *search=[HCDiscoverSearch discoverSearch];
    [self.navigationItem setTitleView:search];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
