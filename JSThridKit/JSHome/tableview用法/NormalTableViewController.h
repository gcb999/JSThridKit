//
//  NormalTableViewController.h
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"


/*
 
 步骤1： 实现JSTableViewControllerDelegate 方法 (必做）
 
 
 步骤2： 创建JSTableViewController 对象 （必做）
 
 
 步骤3： 实现 “网络加载数据” 方法  （必做）
 
 // 网络加载
 -(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage
 
 
 步骤4：实现代理中各个方法...
 
 
 //点击事件
 -(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 
 
 //高度
 -(CGFloat)JSTableViewController:(JSTableViewController *)SWCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;
 
 ....
 
 
 */
@interface NormalTableViewController : JSBasicViewController

@end
