//
//  SWTableViewController+MJRefresh.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController.h"

@interface JSTableViewController (MJRefresh)

-(void)setUpMJRefresh:(JSTableViewState) state;


-(void)loadNewData;

-(void)loadMoreData;


@end
