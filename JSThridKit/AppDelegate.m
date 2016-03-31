//
//  AppDelegate.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "HomeViewController.h"
#import "CenterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
   
    
    
   
   [self initTabbar];
 //    [self initSidePlane];
  
    return YES;
}

#pragma mark 集成tabbar矿建
-(void)initTabbar{
    // Override point for customization after application launch.

    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    [self.window makeKeyAndVisible];


}

#pragma mark 集成左右侧滑的案例

//https://github.com/gotosleep/JASidePanels

-(void)initSidePlane{
    
    //初始化框架
    JASidePanelController *jsVC = [[JASidePanelController alloc] init];
    jsVC.shouldDelegateAutorotateToVisiblePanel = NO;  //这个啥作用，暂时不清楚
  
    //左视图间距
    jsVC.leftGapPercentage = 0.5;   //左边的viewcontroller显示的宽度
    jsVC.bounceOnSidePanelClose = NO;  //当关闭侧边栏的时候不反弹
    jsVC.maximumAnimationDuration = 0;  //最大的反弹动画范围
    
    //右视图间距
    jsVC.rightGapPercentage = 0.3;   //左边的viewcontroller显示的宽度

    
    //左边控制器
    LeftViewController *leftVc=[[LeftViewController alloc] init];
    jsVC.leftPanel = leftVc;  //添加左边的viewcontroller
   
    
    
    
    
    //中间
    CenterViewController *centVc = [[CenterViewController alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:centVc];
    jsVC.centerPanel = nav;  //添加中间的viewcontroller
    
    
    //右边控制器
    RightViewController *rightVc=[[RightViewController alloc] init];
    jsVC.rightPanel=rightVc;
    
    
    //设置属性
    leftVc.JASidePanelCtrl=jsVC;
    leftVc.rightCtrl=rightVc;
    
    rightVc.leftCtrl=leftVc;
    rightVc.JASidePanelCtrl=jsVC;
    
    [self.window setRootViewController:jsVC];
      [self.window makeKeyAndVisible];
    
}



@end
