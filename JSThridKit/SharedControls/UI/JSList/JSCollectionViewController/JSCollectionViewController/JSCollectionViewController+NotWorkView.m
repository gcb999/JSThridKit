//
//  JSCollectionViewController+NotWorkView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController+NotWorkView.h"
#import "XTNetReloader.h"
#import "WeChatStylePlaceHolder.h"

@implementation JSCollectionViewController (NotWorkView)

- (UIView *)makePlaceHolderView {
    UIView *taobaoStyle = [self taoBaoStylePlaceHolder];
    UIView *weChatStyle = [self weChatStylePlaceHolder];
    //    return (arc4random_uniform(2)==0)?taobaoStyle:weChatStyle;
    return taobaoStyle;
}


- (UIView *)taoBaoStylePlaceHolder {
    __block XTNetReloader *netReloader = [[XTNetReloader alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                                  reloadBlock:^{
                                                                      if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
                                                                          [self.collectionView.header beginRefreshing];
                                                                      }
                                                                      else{
                                                                          [self loadNewData];
                                                                      }
                                                                  }] ;
    return netReloader;
}

- (UIView *)weChatStylePlaceHolder {
    WeChatStylePlaceHolder *weChatStylePlaceHolder = [[WeChatStylePlaceHolder alloc] initWithFrame:self.collectionView.frame];
    weChatStylePlaceHolder.delegate = self;
    return weChatStylePlaceHolder;
}

#pragma mark - WeChatStylePlaceHolderDelegate Method

- (void)emptyOverlayClicked:(id)sender {
    if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
        [self.collectionView.header beginRefreshing];
    }
    else{
        [self loadNewData];
    }
}
@end
