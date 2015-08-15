//
//  HCGuideController.m
//  sinaweibo
//
//  Created by huchao on 15/8/15.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCGuideController.h"
#import "HCTabBarController.h"

@interface HCGuideController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scroll;
@property (nonatomic, strong) UIPageControl* pageCtr;
@property (nonatomic, strong) UIButton* loginBtn;
@property (nonatomic, assign) BOOL didSelected;
@end

@implementation HCGuideController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置scrollerView
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    self.scroll = scrollView;
    scrollView.pagingEnabled = YES;
    //设置scrollView的代理
    scrollView.delegate = self;
    //设置滚动范围
    scrollView.contentSize = CGSizeMake(4 * kScreenWidth, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.X = 0;
    scrollView.Y = 0;
    scrollView.W = kScreenWidth;
    scrollView.H = kScreenHeight;
    [self.view addSubview:scrollView];
    [self setScrollerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setScrollerView
{
    for (int i = 0; i < 4; i++) {
        NSString* imgName = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        UIImage* img = [UIImage imageNamed:imgName];
        UIImageView* imgView = [[UIImageView alloc] initWithImage:img];
        imgView.X = i * kScreenWidth;
        imgView.Y = 0;
        imgView.W = kScreenWidth;
        imgView.H = kScreenHeight;
        imgView.userInteractionEnabled = YES;
        [self.scroll addSubview:imgView];
    }

    //在最后一页添加按钮和分享按钮
    //添加按钮
    UIButton* logBtn = [[UIButton alloc] init];
    self.loginBtn = logBtn;
    [logBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [logBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [logBtn setTitle:@"进入微博" forState:UIControlStateNormal];
    [logBtn sizeToFit];
    logBtn.centerX = self.view.centerX + 3 * kScreenWidth;
    logBtn.Y = 510;
    //将按钮添加到scrollerView上
    [logBtn addTarget:self action:@selector(logBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll addSubview:logBtn];
    //添加分享按钮
    UIButton* shareBtn = [[UIButton alloc] init];
    [shareBtn setTitle:@"分享到微博" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn sizeToFit];
    shareBtn.X = 3 * kScreenWidth + (kScreenWidth - shareBtn.W) * 0.5;
    shareBtn.Y = 460;
    [shareBtn addTarget:self action:@selector(shareBtnClikc:) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll addSubview:shareBtn];

    //创建分页符
    UIPageControl* pageCtl = [[UIPageControl alloc] init];
    self.pageCtr = pageCtl;
    pageCtl.currentPageIndicatorTintColor = [UIColor blueColor];
    pageCtl.pageIndicatorTintColor = [UIColor blackColor];
    pageCtl.frame = CGRectMake(0, 550, kScreenWidth, 30);
    pageCtl.currentPage = 0;
    pageCtl.numberOfPages = 4;
    [self.view addSubview:pageCtl];
}

//scrollview的代理方法
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    //获取scrollView的偏移量
    CGPoint offset = self.scroll.contentOffset;
    NSInteger currentNum = round((offset.x) / kScreenWidth);
    self.pageCtr.currentPage = currentNum;
}

//分享按钮点击事件
- (void)shareBtnClikc:(UIButton*)button
{
    if (!self.didSelected) {
        [button setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateNormal];
        self.didSelected=YES;
    }
    else{
       [button setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        self.didSelected=NO;
    }
}
//登陆按钮点击事件
-(void)logBtnClick{
    HCTabBarController *tabBarController=[[HCTabBarController alloc] init];
    [self presentViewController:tabBarController animated:YES completion:nil];
}
@end
