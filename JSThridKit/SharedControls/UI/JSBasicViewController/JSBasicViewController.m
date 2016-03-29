//
//  DLBasicViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@interface JSBasicViewController ()

@end

@implementation JSBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    


    //解决滚动视图20像素的偏移
    if ([[UIDevice currentDevice] systemVersion].floatValue>=7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }

    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
    
    //禁用导航栏手势
//    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    //启用导航栏手势
//    self.fd_interactivePopDisabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
