//
//  JSCollectionViewController+CollectionView.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController.h"

@interface JSCollectionViewController (CollectionView)

#pragma mark ----------------------TableView 刷新方法----------------------------------------
-(void)reloadHeader;

-(void)reloadFooter;

-(void)reloadDate;

#pragma mark ----------------------TableView 隐藏与显示方法----------------------------------------

-(void)hiddenFooter;

-(void)showFooter;

@end
