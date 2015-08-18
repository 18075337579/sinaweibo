//
//  HCAccountModel.h
//  sinaweibo
//
//  Created by huchao on 15/8/18.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCAccountModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, assign) NSInteger expires_in;

@property (nonatomic, copy) NSString *access_token;

@property (nonatomic, copy) NSString *remind_in;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)accountWithDictionary:(NSDictionary *)dict;

@end
