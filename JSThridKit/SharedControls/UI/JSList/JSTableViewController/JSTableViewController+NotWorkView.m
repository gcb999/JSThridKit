//
//  SWTableViewController+NotWorkView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+NotWorkView.h"
#import "XTNetReloader.h"
#import "WeChatStylePlaceHolder.h"

@implementation JSTableViewController (NotWorkView)

#pragma mark - CYLTableViewPlaceHolderDelegate Method

- (UIView *)makePlaceHolderView {
    UIView *taobaoStyle = [self taoBaoStylePlaceHolder];
    UIView *weChatStyle = [self weChatStylePlaceHolder];
//    return (arc4random_uniform(2)==0)?taobaoStyle:weChatStyle;
    return weChatStyle;
}


- (UIView *)taoBaoStylePlaceHolder {
    __block XTNetReloader *netReloader = [[XTNetReloader alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                                  reloadBlock:^{
                                                                      if ([self.tableView.header respondsToSelector:@selector(beginRefreshing)]) {
                                                                          [self.tableView.header beginRefreshing];
                                                                      }
                                                                      else{
                                                                          [self loadNewData];
                                                                      }
                                                                      
                                                                  }] ;
    return netReloader;
}

- (UIView *)weChatStylePlaceHolder {
    WeChatStylePlaceHolder *weChatStylePlaceHolder = [[WeChatStylePlaceHolder alloc] initWithFrame:self.tableView.frame];
    weChatStylePlaceHolder.delegate = self;
    return weChatStylePlaceHolder;
}

#pragma mark - WeChatStylePlaceHolderDelegate Method

- (void)emptyOverlayClicked:(id)sender {
    if ([self.tableView.header respondsToSelector:@selector(beginRefreshing)]) {
        [self.tableView.header beginRefreshing];
    }
    else{
        [self loadNewData];
    }
}

@end
