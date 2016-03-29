//
//  DLNetWoring.h
//  DealSale
//
//  Created by gcb999 on 15/8/6.
//  Copyright (c) 2015年 com.sailvan.dealsale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSError.h"
#import "AFHTTPRequestOperationManager.h"
#import "Reachability.h"



#define KCBNetWoringTag 100000
static NSString *contentType=@"application/json";//@"text/html"



@interface JSNetWork : NSObject


+(JSNetWork *)ShareNetWork;



@end

