//
//  DLNetWoring.m
//  DealSale
//
//  Created by gcb999 on 15/8/6.
//  Copyright (c) 2015年 com.sailvan.dealsale. All rights reserved.
//

#import "JSNetWork.h"




@interface JSNetWork(){

}


@end

@implementation JSNetWork


#pragma mark - LifeCycle

+(JSNetWork *)ShareNetWork{
    
    static JSNetWork *network=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network=[[self alloc] init];
    });
    return network;
}






#pragma mark--请求成功

-(BOOL)isConnectNetWork{
    BOOL isExistenceNetwork = YES;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork=NO;
            //            NSLog(@"没有网络");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork=YES;
            //            NSLog(@"正在使用3G网络");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork=YES;
            //            NSLog(@"正在使用wifi网络");
            break;
    }
    return isExistenceNetwork;
}


@end
