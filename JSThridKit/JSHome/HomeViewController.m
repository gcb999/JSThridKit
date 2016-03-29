//
//  HomeViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableCell.h"

//tableview
#import "NormalTableViewController.h"
#import "HeaderAnimationTableViewViewController.h"

//collectionview
#import "NormalCollecionViewController.h"
#import "FlowOutCollectionViewController.h"
//tabbar
#import "JSTabbarViewController.h"


@interface HomeViewController ()<JSTableViewControllerDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"home";
    self.view.backgroundColor=[UIColor whiteColor];
    
  

    
    
    
    
    CGRect rect =self.view.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewNormal tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    NSArray *date=@[
                    
                    @"TableView用法",
                    @"TableView头部动画用法",
                    @"CollectionView用法",
                    @"CollectionView流水布局",
                    @"CYLTabBarController的用法"
                    
                    ];
    SWCtrl.date=date;
    [SWCtrl reloadHeader];
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        NormalTableViewController *ctrl=[[NormalTableViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==1) {
        HeaderAnimationTableViewViewController *ctrl=[[HeaderAnimationTableViewViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==2) {
        NormalCollecionViewController *ctrl=[[NormalCollecionViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==3) {
        FlowOutCollectionViewController *ctrl=[[FlowOutCollectionViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==4) {
        JSTabbarViewController *ctrl=[[JSTabbarViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    //CYLTabBarViewController
    
    
}


@end
