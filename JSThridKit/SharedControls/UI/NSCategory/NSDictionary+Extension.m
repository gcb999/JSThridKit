//
//  NSDictionary+Extension.m
//  DealSale
//
//  Created by 317744017@qq.com on 15/8/27.
//  Copyright (c) 2015年 317744017@qq.com. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (extension)

+(NSString *)getStringByKey:(NSDictionary *)objc Key:(NSString *)key
{
    
   
    NSString *returnStr=@"";
    
    id obj=nil;
    if (objc==nil) {
        return returnStr;
    }
    
    //递归大法来找key  哎......
    if([objc isKindOfClass:[NSArray class]])
    {
        NSArray *array=(NSArray *)objc;
        for (NSInteger i=0; i<array.count; i++) {
            id tempOjbc=[array objectAtIndex:i];
            if (
                [tempOjbc isKindOfClass:[NSDictionary class]] ||
                 [tempOjbc isKindOfClass:[NSArray class]]
                 ) {
                obj=tempOjbc;
                 returnStr=[self getStringByKey:obj Key:tempOjbc];
                if (returnStr .length!=0) {
                       break;
                }
             
            }
        }
        
        return returnStr;
    }
        
    obj=[objc objectForKey:key];
    
    if(obj==nil)
    {
        return returnStr;
    }
    if (![obj isKindOfClass:[NSNull class]] ) {
        if ([obj isKindOfClass:[NSString class]]) {
            returnStr=[objc objectForKey:key];
            if ([returnStr isEqualToString:@"null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"NULL"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"Null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"(null)"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"<null>"]) {
                returnStr=@"";
            }
            
            
        }else{
            
            returnStr=[NSString stringWithFormat:@"%@",[objc objectForKey:key]];
            if ([returnStr isEqualToString:@"null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"NULL"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"Null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"(null)"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"<null>"]) {
                returnStr=@"";
            }

            
        }
    }
    return returnStr;
}

-(NSString *)toStringByKey:(NSString *)key
{
    NSString *returnStr=@"";
    if (self==nil) {
        return returnStr;
    }
 
    
    id obj=[self objectForKey:key];
    //递归大法来找key  哎......
    if([self isKindOfClass:[NSArray class]])
    {
        NSArray *array=(NSArray *)self;
        for (NSInteger i=0; i<array.count; i++) {
            id tempOjbc=[array objectAtIndex:i];
            if (
                [tempOjbc isKindOfClass:[NSDictionary class]] ||
                [tempOjbc isKindOfClass:[NSArray class]]
                ) {
                obj=tempOjbc;
                returnStr=[NSDictionary getStringByKey:obj Key:tempOjbc];
                if (returnStr .length!=0) {
                    break;
                }
                
            }
        }
        
        return returnStr;
    }

    
    
    if(obj==nil)
    {
        return returnStr;
    }
    if (![obj isKindOfClass:[NSNull class]] ) {
        if ([obj isKindOfClass:[NSString class]]) {
            returnStr=[self objectForKey:key];
            if ([returnStr isEqualToString:@"null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"NULL"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"Null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"(null)"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"<null>"]) {
                returnStr=@"";
            }
            
            
        }else{
            
            returnStr=[NSString stringWithFormat:@"%@",[self objectForKey:key]];
            if ([returnStr isEqualToString:@"null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"NULL"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"Null"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"(null)"]) {
                returnStr=@"";
            }
            if ([returnStr isEqualToString:@"<null>"]) {
                returnStr=@"";
            }
            
            
        }
    }
    return returnStr;
}


@end
