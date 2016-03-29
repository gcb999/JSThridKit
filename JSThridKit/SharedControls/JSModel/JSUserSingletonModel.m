//
//  JSUserSingletonModel.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSUserSingletonModel.h"

@implementation JSUserSingletonModel

+(JSUserSingletonModel*)getInstance{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
        
    });
    return _sharedObject;
}



@end
