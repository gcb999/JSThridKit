//
//  UIView+FrameLayout.m
//
//  Created by Beyond on 15/10/2.
//  Copyright (c) 2015年 Beyond. All rights reserved.
//

#import "UIView+FrameLayout.h"

@implementation UIView (FrameLayout)

#pragma mark - X,Y
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}


#pragma mark - Top,Left,Bottom,Right
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

#pragma mark - Width,Height
- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


#pragma mark - CenterX,CenterY
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark - ScreenX,Y,Frame
- (CGFloat)screenX
{
    return self.screenFrame.origin.x;
}

- (CGFloat)screenY
{
    return self.screenFrame.origin.y;
}


- (CGRect)screenFrame {
    
    return [self.topSuperView convertRect:self.frame fromView:self.superview];
}


#pragma mark - Orign,Size
- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark- LastSubview,FirstSbuView,RemoveSubView

- (UIView *)lastSubView
{
    return  [self.subviews lastObject];
}

- (UIView *)firstSubView
{
    return [self.subviews firstObject];
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

#pragma mark-  SetEqual:Center,CenterX,CenterY,Top,Left,Bottom,Right,Width,Height

- (void)setCenterEqualToView:(UIView *)view
{
    self.center = view.center;
}

- (void)setCenterXEqualToView:(UIView *)view
{
    self.centerX = view.centerX;
}

- (void)setCenterYEqualToView:(UIView *)view
{
    self.centerY = view.centerY;
}

- (void)setTopEqualToView:(UIView *)view
{
    self.top = view.top;
}

- (void)setLeftEqualToView:(UIView *)view
{
    self.left = view.left;
}

- (void)setBottomEqualToView:(UIView *)view
{
    self.bottom = view.bottom;
}

- (void)setRightEqualToView:(UIView *)view
{
    self.right = view.right;
}

- (void)setSizeEqualToView:(UIView *)view
{
    self.size = view.size;
}

- (void)setHightEqualToView:(UIView *)view
{
    self.height = view.height;
}

- (void)setWidthEqualToView:(UIView *)view
{
    self.width = view.width;
}

- (void)setHorizontalCenterEqualToWindow
{
    self.centerX = [UIScreen mainScreen].bounds.size.width / 2.f;
}

- (void)setVerticalCenterEqualToWindow
{
    self.centerY = [UIScreen mainScreen].bounds.size.height / 2.f;
}

- (void)setCenterEqualToWindow
{
    [self setHorizontalCenterEqualToWindow];
    [self setVerticalCenterEqualToWindow];
}


#pragma mark- SetFill:WidthFill,HeightFill,FillSize
- (void)setFillHeighToSuperView
{
    self.height = self.superview.height;
}

- (void)setFillWidthToSuperView
{
    self.width = self.superview.width;
}

- (void)setFillSizeToSuperView
{
    self.frame = CGRectMake(0.f, 0.f, self.superview.width, self.superview.height);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (!topSuperView) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}


//得到此view 所在的viewController
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



@end
