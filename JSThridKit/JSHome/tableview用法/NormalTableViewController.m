//
//  NormalTableViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//



#import "NormalTableViewController.h"
#import "HomeTableCell.h"

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



@interface NormalTableViewController ()<JSTableViewControllerDelegate>

@end

@implementation NormalTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"tableView的所用用法";
    
    
    
    
    
    
    CGRect rect =self.view.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewPullHeaderFooter tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    if (currentPage==1) {//初次加载 或者上拉刷新
        [JSCtrl.date removeAllObjects];
        NSArray *date=@[@"1",@"2"];
        [JSCtrl.date addObjectsFromArray:date];
        [JSCtrl reloadHeader];
    }
    else if (currentPage==2){//下拉刷新
        NSArray *date=@[@"2",@"3"];
        [JSCtrl.date addObjectsFromArray:date];
        [JSCtrl reloadFooter];
        
    }
    else if(currentPage==3){//无数据的数据的时候调出 无网View
        
        [JSCtrl.date removeAllObjects];
        [JSCtrl reloadFooter];
        
    }
}


#pragma mark --实现自定头部View 协议

-(UIView *)JSTableViewControllerWithViewForTableHeaderView{
    
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 50)];
    contentView.backgroundColor=KCOLOR_BLACK;
    
    UILabel *lb=[UILabel LabWithFrame:contentView.bounds text:@"自定义头部View" textColor:KCOLOR_WHITE textAlign:NSTextAlignmentCenter font:KBIG_FONT_SIZE];
    [contentView addSubview:lb];
    
    return contentView;
    
}

#pragma mark --实现自定尾部View 协议

-(UIView *)JSTableViewControllerWithViewForTableFooterView{
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 50)];
    contentView.backgroundColor=[UIColor redColor];
    
    UILabel *lb=[UILabel LabWithFrame:contentView.bounds text:@"自定义尾部View" textColor:KCOLOR_WHITE textAlign:NSTextAlignmentCenter font:KBIG_FONT_SIZE];
    [contentView addSubview:lb];
    
    return contentView;
    
}


@end
