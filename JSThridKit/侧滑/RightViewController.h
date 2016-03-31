//
//  RightViewController.h
//  JSThridKit
//
//  Created by gcb999 on 16/3/31.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@class JASidePanelController;
@class LeftViewController;

@interface RightViewController : JSBasicViewController


@property(nonatomic,strong)JASidePanelController *JASidePanelCtrl;

@property(nonatomic,strong) LeftViewController *leftCtrl;

@end
