//
//  NormalCollecionViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NormalCollecionViewController.h"
#import "CollectionHeaderView.h"
#import "CollectionFooterView.h"
#import "CollectionViewCell.h"

@interface NormalCollecionViewController ()<JSCollectionViewControllerDelegate>

@end

@implementation NormalCollecionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Collection的常用用法";
    
    
    
    
    
    
    CGRect rect =self.view.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[CollectionViewCell class] delegate:self HeaderViewType:[CollectionHeaderView class] footerViewClass:[CollectionFooterView class]];
    ctrl.view.frame=rect;
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    if (currentPage==1) {//初次加载 或者上拉刷新
        [SWCtrl.date removeAllObjects];
        NSArray *date=@[@"1",@"2"];
        [SWCtrl.date addObjectsFromArray:date];
        [SWCtrl reloadHeader];
    }
    else if (currentPage==2){//下拉刷新
        NSArray *date=@[@"2",@"3"];
        [SWCtrl.date addObjectsFromArray:date];
        [SWCtrl reloadFooter];
        
    }
    else if(currentPage==3){//无数据的数据的时候调出 无网View
        
        [SWCtrl.date removeAllObjects];
        [SWCtrl reloadFooter];
        
    }
}


#pragma mark --实现自定头部View 协议

-(CGSize)JSCollectionViewController:(JSCollectionViewController *)SWCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(IPHONScreenWidth, 50);
}


#pragma mark --实现自定尾部View 协议

-(CGSize)JSCollectionViewController:(JSCollectionViewController *)SWCtrl layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(IPHONScreenWidth, 50);
}


@end
