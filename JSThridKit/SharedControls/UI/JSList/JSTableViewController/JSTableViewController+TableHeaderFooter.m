//
//  SWTableViewController+TableHeaderFooter.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+TableHeaderFooter.h"

@implementation JSTableViewController (TableHeaderView)

-(void)setUpTableFooterView{

    if ([self.delegate respondsToSelector:@selector(JSTableViewControllerWithViewForTableFooterView)]) {
    
        self.tableView.tableFooterView=[self.delegate JSTableViewControllerWithViewForTableFooterView];
    }
    else{
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        self.tableView.tableFooterView=v;
    }
}


-(void)setUpTableHeaderView{
    
    if ([self.delegate respondsToSelector:@selector(JSTableViewControllerWithViewForTableHeaderView)]) {
        
        self.tableView.tableHeaderView=[self.delegate JSTableViewControllerWithViewForTableHeaderView];
    }
    else{
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        self.tableView.tableHeaderView=v;
    }
}



@end
