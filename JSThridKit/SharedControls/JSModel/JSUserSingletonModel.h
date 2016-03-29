//
//  JSUserSingletonModel.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSUserSingletonModel : NSObject

+ (JSUserSingletonModel*)getInstance;


//用户Email
@property(nonatomic,copy)NSString *email;


//用户名
@property(nonatomic,copy)NSString *userName;


//用户ID
@property(nonatomic,copy)NSString *userId;


//TOKE
@property(nonatomic,copy)NSString *toke;

//sesion

@property(nonatomic,copy)NSString *sesion;


//国家编码
@property(nonatomic,copy)NSString *countryCode;


//货币
@property(nonatomic,copy)NSString *currency;


//语言
@property(nonatomic,copy)NSString *language;

//购物车数量
@property(nonatomic,copy)NSString *carQty;



@end
