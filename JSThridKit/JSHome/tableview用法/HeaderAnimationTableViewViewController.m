//
//  HeaderAnimationTableViewViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HeaderAnimationTableViewViewController.h"
#import "FirstViewController.h"
#import "HomeTableCell.h"

@interface HeaderAnimationTableViewViewController ()<JSTableViewControllerDelegate>

@end

@implementation HeaderAnimationTableViewViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    CGRect rect =self.view.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewPullFooter tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
    
    
    
    //子view
    
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = CGPointMake(IPHONScreenWidth*0.5f, 100);
    
    
    [ctrl stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    
    
    
    
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    
    if (currentPage==1) {
        NSArray *temp=@[@"1",@"2"];
        [SWCtrl.date addObjectsFromArray:temp];
        [SWCtrl reloadHeader];
    }
    else if (currentPage==2){
        
        [SWCtrl.date addObject:@"dd"];
        [SWCtrl reloadFooter];
    }
    else{
        [SWCtrl.date removeAllObjects];
        [SWCtrl reloadFooter];
    }
    
    
    
    
    
    
}

-(void)testPush{
    FirstViewController *ctrl=[[FirstViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}


@end
