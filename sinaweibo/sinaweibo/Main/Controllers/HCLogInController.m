//
//  HCLogInController.m
//  sinaweibo
//
//  Created by huchao on 15/8/18.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCLogInController.h"
#import "AFNetworking.h"
#import "HCAccountModel.h"

#define kclient_id @"2568508312"
#define kredirect_uri @"http://www.baidu.com/"
#define kclient_secret @"e4e7cf6b8971ae4838120a01e408dccf"

@interface HCLogInController () <UIWebViewDelegate>

@end

//App Secret：e4e7cf6b8971ae4838120a01e408dccf

@implementation HCLogInController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建UIWebView并添加到self.view中
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    //设置代理
    webView.delegate = self;
    [self.view addSubview:webView];
    //拼接路径
    NSString* urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", kclient_id, kredirect_uri];
    
    NSURL* url = [NSURL URLWithString:urlStr];
    //创建请求
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //加载登陆页面
    [webView loadRequest:request];
}
#pragma UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    NSLog(@"%@",request.URL.absoluteString);
    NSString *urlStr=request.URL.absoluteString;
    //判断是否是授权回调页
    if ([urlStr hasPrefix:kredirect_uri]) {
        NSLog(@"%@",urlStr);
        //是回调页,获取用户的授权码
        NSRange range=[urlStr rangeOfString:@"code="];
        if (range.location != NSNotFound) {
            NSString *code=[urlStr substringFromIndex:range.location + range.length];
            [self getAccessTokenWithCode:code];
        }
        return NO;
    }
    return YES;
}

//获取access_token
-(void)getAccessTokenWithCode:(NSString *)code{
    //获取access_token
    //            必选	类型及范围	说明
    //            client_id	true	string	申请应用时分配的AppKey。
    //            client_secret	true	string	申请应用时分配的AppSecret。
    //            grant_type	true	string	请求的类型，填写authorization_code
    //
    //            grant_type为authorization_code时
    //            必选	类型及范围	说明
    //            code	true	string	调用authorize获得的code值。
    //            redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
    //利用AFNetWorking发送请求
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//   AFHTTPResponseSerializer
    NSString *urlStr=@"https://api.weibo.com/oauth2/access_token";
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    //app key
    parameters[@"client_id"]=kclient_id;
    //app secret
    parameters[@"client_secret"]=kclient_secret;
    parameters[@"grant_type"]=@"authorization_code";
    //用户授权码
    parameters[@"code"]=code;
    //回调地址redirect_uri
    parameters[@"redirect_uri"]=kredirect_uri;
    NSLog(@"%@",parameters[@"redirect_uri"]);
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSDictionary *dict=responseObject;
        HCAccountModel *accountModel=[HCAccountModel accountWithDictionary:dict];
        
        //保存账号信息
        //获取沙盒document路径
        NSString *accountFilePath=kAccountFilePath;
        //拼接文件路径

        [NSKeyedArchiver archiveRootObject:accountModel toFile:accountFilePath];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
        NSLog(@"请求失败:%@",error);
    }];
 
}
@end
