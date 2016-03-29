//
//  HomeViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableCell.h"

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
    
//    if (indexPath.row==0) {
//        MJPullTableVIewController *ctrl=[[MJPullTableVIewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
//    else if (indexPath.row==1) {
//        HeaderAnmaitonViewController *ctrl=[[HeaderAnmaitonViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
//    else if (indexPath.row==2) {
//        MJPullCollectionViewController *ctrl=[[MJPullCollectionViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
//    else if (indexPath.row==3) {
//        FlowOutControllerViewController *ctrl=[[FlowOutControllerViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
//    else if (indexPath.row==4) {
//        CYLTabBarViewController *ctrl=[[CYLTabBarViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
    //CYLTabBarViewController
    
    
}


@end
