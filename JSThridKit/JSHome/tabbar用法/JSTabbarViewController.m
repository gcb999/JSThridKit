//
//  JSTabbarViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTabbarViewController.h"
#import "HeaderAnimationTableViewViewController.h"
#import "UIViewController+CYLJumpToOtherTabBarControllerItem.h"

@interface JSTabbarViewController ()

@end

@implementation JSTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect hrect,rect=self.view.bounds;
    NSArray *date=@[
                    @"显示BadgeValue",
                    @"显示标题",
                    @"显示跳转",
                    @"显示自定义",
                    
                    ];
    
    for (int i=0; i<date.count; i++) {
        CGRectDivide(rect, &hrect, &rect, 50, CGRectMinYEdge);
        
        UIButton *btn=[UIButton ButtonWithImageName:nil hImageName:nil frame:hrect title:date[i] titleColor:[UIColor redColor] font:KBIG_FONT_SIZE target:self action: @selector(click:)];
        btn.tag=i;
        [self.view addSubview:btn];
    }
    
}

-(void)click:(UIButton *)btn{
    NSInteger i=btn.tag;
    if (i==0) {
        //sets navigation bar title.
        [self.navigationController.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", 10]];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    else if(i==1){
        self.navigationItem.title = [NSString stringWithFormat:@"首页(%d)", 10];
    }
    else if(i==2){
        //第一个参数必须是根控制器，否则会报错
        [self cyl_jumpToOtherTabBarControllerItem:[HeaderAnimationTableViewViewController class] performSelector:@selector(testPush) arguments:nil];
    }
    else if(i==3){
        
        
    }
}

@end
