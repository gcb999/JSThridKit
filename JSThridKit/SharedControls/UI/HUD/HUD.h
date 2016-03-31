//
//  HUD.h
//  MBLoadingHUD
//
//  Created by develop on 15/9/21.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
//https://github.com/songhailiang/MBLoadingHUD

@interface HUD : NSObject

/**
 *  隐藏hud
 */
+ (void)hideHUD;

/**
 *  显示hud（只有图片）
 */
+ (void)showLoadingHUD;

/**
 *  显示hud（图片+文字）
 *
 *  @param text 文字内容
 */
+ (void)showLoadingHUDWithText:(NSString *)text;

/**
 *  显示hud（图片+文字）
 *
 *  @param text          文字内容
 *  @param containerView 容器View
 */
+ (void)showLoadingHUDWithText:(NSString *)text inView:(UIView *)containerView;

/**
 *  显示hud（图片+文字）
 *
 *  @param text          文字内容
 *  @param containerView 容器View
 *  @param imageBgColor 中间图片背景色彩
 *  @param imageFrame 中间图片大小
 */

+ (void)showLoadingHUDWithText:(NSString *)text inView:(UIView *)containerView imageBgColor:(UIColor *)imageBgColor  imageFrame:(CGRect)imageFrame;

@end
