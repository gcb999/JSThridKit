//
//  UIView+FrameLayout.h
//
//  Created by Beyond on 15/10/2.
//  Copyright (c) 2015年 Beyond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameLayout)

@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;

@property(nonatomic,assign) CGFloat left;
@property(nonatomic,assign) CGFloat top;
@property(nonatomic,assign) CGFloat right;
@property(nonatomic,assign) CGFloat bottom;

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

@property(nonatomic,assign,readonly) CGFloat screenX;
@property(nonatomic,assign,readonly) CGFloat screenY;
@property(nonatomic,assign,readonly) CGRect screenFrame;

@property(nonatomic,assign) CGPoint origin;
@property(nonatomic,assign) CGSize size;

- (void)setCenterEqualToView:(UIView *)view;
- (void)setCenterXEqualToView:(UIView *)view;
- (void)setCenterYEqualToView:(UIView *)view;

//相对于屏幕
- (void)setHorizontalCenterEqualToWindow;
- (void)setVerticalCenterEqualToWindow;
- (void)setCenterEqualToWindow;

- (void)setTopEqualToView:(UIView *)view;
- (void)setLeftEqualToView:(UIView *)view;
- (void)setBottomEqualToView:(UIView *)view;
- (void)setRightEqualToView:(UIView *)view;

- (void)setSizeEqualToView:(UIView *)view;
- (void)setHightEqualToView:(UIView *)view;
- (void)setWidthEqualToView:(UIView *)view;

- (void)setFillWidthToSuperView;
- (void)setFillHeighToSuperView;
- (void)setFillSizeToSuperView;

- (UIView *)lastSubView;
- (UIView *)firstSubView;

- (void)removeAllSubviews;

- (UIView *)topSuperView; //最高级父视图

- (UIViewController*)viewController; //获取此view所在的controller


@end
