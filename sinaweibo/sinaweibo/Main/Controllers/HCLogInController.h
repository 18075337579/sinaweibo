//
//  HCLogInController.h
//  sinaweibo
//
//  Created by huchao on 15/8/18.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kAccountFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"account.txt"]
@interface HCLogInController : UIViewController

@end
