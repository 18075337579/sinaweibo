//
//  HCAccountModel.m
//  sinaweibo
//
//  Created by huchao on 15/8/18.
//  Copyright (c) 2015年 huchao. All rights reserved.
//

#import "HCAccountModel.h"

@implementation HCAccountModel
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)accountWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

//解档方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.access_token=[coder decodeObjectForKey:@"access_token"];
        self.uid=[coder decodeObjectForKey:@"uid"];
        self.expires_in=[coder decodeIntegerForKey:@"expires_in"];
        self.remind_in=[coder decodeObjectForKey:@"remind_in"];
    }
    return self;
}
//归档方法
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInteger:self.expires_in forKey:@"expires_in"];

}


@end
