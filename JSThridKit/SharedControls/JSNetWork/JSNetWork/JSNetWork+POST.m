//
//  DLNetWoring+POST.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+POST.h"

@implementation JSNetWork (POST)

#pragma mark -获取Post请求体

-(NSDictionary *)PostBody:(NSDictionary *)postBody{
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
    

    
    
    
    NSMutableDictionary *m_BodyDic=[NSMutableDictionary dictionaryWithDictionary:postBody];
    [m_BodyDic addEntriesFromDictionary:@{@"app_identify_key":toke,
                                          @"currency":currency,
                                          @"country_code":country_code,
                                          @"lang":lng,
                                          
                                          }];
    
     if (!IS_NSString(session))  {
        [m_BodyDic addEntriesFromDictionary:@{@"session":session}];
        
    }
    
    
    NSMutableDictionary *resultdic=[NSMutableDictionary dictionaryWithDictionary:postBody];

    
    //POST
    [resultdic addEntriesFromDictionary:@{@"post":m_BodyDic}];
    
    
    NSLog(@"___post请求体 %@",m_BodyDic);


    return resultdic;
}


#pragma mark -发送请求

-(void)request:(NSString *)url postBody:(NSDictionary *)postBody activityView:(UIView *)ActivityView  result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    
    
    if (url==nil) {
        url=DLURL;
    }
    else{
        url= [NSString stringWithFormat:@"%@?%@",DLURL,url];
    }

    if (ActivityView) {
        [MBProgressHUD showHUDAddedTo:ActivityView animated:YES];
    }
    
    
    //获取请求体
    NSDictionary *postbodyDic =[self PostBody:postBody];

    AFHTTPRequestOperationManager *afmanager=[[AFHTTPRequestOperationManager alloc]init];
    afmanager.requestSerializer.timeoutInterval=30;
    afmanager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [afmanager POST:url parameters:postbodyDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        
        
        NSDictionary *rootDic=(NSDictionary *)responseObject;
        NSLog(@"the reg response is %@",rootDic);
        
        
        
        if ([rootDic[@"result"] isEqualToString:@"success"]) {
            
         
            
        }
        else{
            
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
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error1) {
        
        [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        JSError *error=[[JSError alloc] init];
        error.errorState=ErrorStatus_Error;
        error.errorMessage=error1.localizedDescription;
        result(NO,nil,error);
    }];
    
}




#pragma mark ---------------------------AFNetWork  POST Method---------------------------



-(void)postUrl:(NSString *)url postBody:(NSDictionary *)postBody result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url postBody:postBody activityView:nil result:result];
}

-(void)postUrl:(NSString *)url postBody:(NSDictionary *)postBody   ActivityView:(UIView *)activityView result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url postBody:postBody activityView:activityView result:result];
}



@end
