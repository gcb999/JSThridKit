//
//  SWTableViewController+MJRefresh.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+MJRefresh.h"

@implementation JSTableViewController (MJRefresh)

#pragma mark ----------------------初始化MJ 头部、底部----------------------------------------


-(void)setUpMJRefresh:(JSTableViewState) state{
    
    if (state==JSTableViewNormal) {
        
        
    }
    else if (state==JSTableViewPullHeader)//只显示头部
    {
        [self setUpMJHeder];
        
    }
    else if (state==JSTableViewPullFooter){//只显示尾部
        
        [self setUpMJFooter];
    }
    else if (state==JSTableViewPullHeaderFooter){
        
        [self setUpMJHeder];
        [self setUpMJFooter];
    }    
    
}





#pragma mark -添加头部
-(void)setUpMJHeder
{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    //    header.stateLabel.hidden = YES;
    
    
    // 设置字体
    header.stateLabel.font = KSMALL_FONT_SIZE;
    header.lastUpdatedTimeLabel.font = KSMALL_FONT_SIZE;
    
    // 设置颜色
    header.stateLabel.textColor = KCOLOR_BLACK;
    header.lastUpdatedTimeLabel.textColor = KCOLOR_BLACK;
    
    // 设置刷新控件
    self.tableView.header = header;
    
    
}

#pragma mark -添加尾部
-(void)setUpMJFooter
{
    
    
    //        [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    // 添加默认的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置文字
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = KSMALL_FONT_SIZE;
    
    // 设置颜色
    footer.stateLabel.textColor = KCOLOR_BLACK;
    
    // 设置footer
    self.tableView.footer = footer;
    //
}


#pragma mark -上拉刷新数据


-(void)loadNewData{
    
    
    self.pageIndex=1;
    //请求网络
    if(self.delegate && [self.delegate respondsToSelector:@selector(JSTableViewController:LoadRequestCurrentPage:)]){
        [self.delegate JSTableViewController:self LoadRequestCurrentPage:self.pageIndex];
    }
    
    
    
}

#pragma mark -下拉更多数据

-(void)loadMoreData{
    
    self.pageIndex=self.pageIndex+1;
    //请求网络
    if(self.delegate && [self.delegate respondsToSelector:@selector(JSTableViewController:LoadRequestCurrentPage:)]){
        [self.delegate JSTableViewController:self LoadRequestCurrentPage:self.pageIndex];
    }
}




@end
