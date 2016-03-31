//
//  LeftViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/31.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "LeftViewController.h"
#import "HomeTableCell.h"
//tableview
#import "NormalTableViewController.h"
#import "HeaderAnimationTableViewViewController.h"

//collectionview
#import "NormalCollecionViewController.h"
#import "FlowOutCollectionViewController.h"

//tabbar
#import "JSTabbarViewController.h"

#import "HudViewController.h"

#import "JASidePanelController.h"
#import "RightViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

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
                    @"打开左侧滑",
                    @"CYLTabBarController的用法",
                    @"HUD的用法",
                    ];
    SWCtrl.date=date;
    [SWCtrl reloadHeader];
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UINavigationController *nav=(UINavigationController *)self.JASidePanelCtrl.centerPanel;
    [nav popToRootViewControllerAnimated:YES];
    
    //关闭左边
    [self.JASidePanelCtrl toggleLeftPanel:nil];
    
    //显示左边
    //[self.sidePanelCtrl showLeftPanelAnimated:YES];

    if (indexPath.row==0) {
        
        
     
        NormalTableViewController *ctrl=[[NormalTableViewController alloc] init];
        [nav pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==1) {
        HeaderAnimationTableViewViewController *ctrl=[[HeaderAnimationTableViewViewController alloc] init];
              [nav pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==2) {
        NormalCollecionViewController *ctrl=[[NormalCollecionViewController alloc] init];
               [nav pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==3) {
        [self.JASidePanelCtrl toggleLeftPanel:nil];
    }
    else if (indexPath.row==4) {
        JSTabbarViewController *ctrl=[[JSTabbarViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==5) {
        [[SDImageCache sharedImageCache] clearDisk];
        HudViewController *ctrl=[[HudViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    

    
    
}

@end
