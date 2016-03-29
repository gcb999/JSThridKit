//
//  MBProgressHUD+Add.m
//  TestFrame
//
//  Created by zy on 13-8-27.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view{
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = error;
    // 设置图片
    //  hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert_failed_icon.png"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
    
//    hud.color = [UIColor blackColor];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view {
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.color = [UIColor blackColor];
    
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    return hud;
}@end
