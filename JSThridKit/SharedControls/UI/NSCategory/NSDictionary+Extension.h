//
//  NSDictionary+Extension.h
//  DealSale
//
//  Created by 317744017@qq.com on 15/8/27.
//  Copyright (c) 2015年 317744017@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (extension)

+(NSString *)getStringByKey:(NSDictionary *)objc Key:(NSString *)key;

-(NSString *)toStringByKey:(NSString *)key;
@end
