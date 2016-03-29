//
//  DLNetWoring+GET.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+GET.h"

@implementation JSNetWork (GET)



#pragma mark -获取完整的URL

-(NSString *)AbsoluteUrl:(NSString *)url{
    //Session
    //Session
    NSString *session= [JSUserSingletonModel getInstance].sesion;
    if (!IS_NSString(session)) session=@"";
    
    
    
    //country code
    NSString *country_code= [JSUserSingletonModel getInstance].countryCode;
    if (!IS_NSString(country_code)) country_code=@"";
    
    
    // lng
    NSString *lng= [JSUserSingletonModel getInstance].language;
    if (!IS_NSString(lng)) lng=@"";
    
    
    
    //current
    NSString *currency= [JSUserSingletonModel getInstance].currency;
    if (!IS_NSString(currency)) currency=@"";
    
    
    //toke
    NSString *toke= [JSUserSingletonModel getInstance].toke;
    if (!IS_NSString(toke)) toke=@"";
    


    
    url= [NSString stringWithFormat:@"%@?%@/app_identify_key/%@/lng/%@/currency/%@/country_code/%@",DLURL,url,toke,lng,currency,country_code];
    
    
    if (IS_NSString(session)) {
        url = [NSString stringWithFormat:@"%@/session/%@",url,session];
    }
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return url;
    
}




#pragma mark -发送请求

-(void)request:(NSString *)url activityView:(UIView *)ActivityView  result:(void (^)(BOOL, NSDictionary *, JSError *))result{

    
        if (ActivityView) {
            [MBProgressHUD showHUDAddedTo:ActivityView animated:YES];
        }
    
    
        NSString *absoluteUrl=[self AbsoluteUrl:url];


        AFHTTPRequestOperationManager*  afmanager=[[AFHTTPRequestOperationManager alloc]init];
        afmanager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:contentType, nil];
        [afmanager GET:absoluteUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic=(NSDictionary *)responseObject;
      
        if (ActivityView) {
            [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        }
            
        NSLog(@"Get请求Response=======\n%@",rootDic);
        
            
        if ([rootDic[@"result"] isEqualToString:@"success"]) {
          
            result(YES,rootDic,nil);
        }
        else
        {
            
            JSError *error=[[JSError alloc] init];
            NSString *errcode=rootDic[@"errcode"];
            if ([errcode isEqualToString:@"0x1009"]) {//过期
                
                error.errorState=ErrorState_SessionExpire;
            }
            else{
                
                error.errorState=ErrorStatus_DateError;
                
            }
            NSString *errorMessage=rootDic[@"errmsg"];
            if (errorMessage==nil || [errorMessage isKindOfClass:[NSNull class]]|| IS_NSString(errorMessage)) {
                errorMessage=@"";
            }
            error.errorMessage=errorMessage;
            
            result(NO,rootDic,error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error1) {
       [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        JSError *error=[[JSError alloc] init];
        error.errorState=ErrorStatus_Error;
        error.errorMessage=error1.localizedDescription;
        result(NO,nil,error);
    }];

}



-(void)GetUrl:(NSString *)url result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url activityView:nil result:result];
}

-(void)GetUrl:(NSString *)url ActivityView:(UIView *)activityView result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url activityView:activityView result:result];
}






@end
