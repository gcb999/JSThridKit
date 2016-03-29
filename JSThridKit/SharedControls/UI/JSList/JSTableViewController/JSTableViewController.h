//
//  SWTableViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CYLTableViewPlaceHolder.h"
#import "JSStretchableTableHeaderView.h"


@protocol JSTableViewControllerDelegate;
@protocol JSTableViewCellDelegate;


typedef enum {
    /** 普通列表 */
    JSTableViewNormal = 1,
    /** 显示上拉 */
    JSTableViewPullHeader=2,
    /** 显示下拉 */
    JSTableViewPullFooter=3,
    /** 显示上下拉 */
    JSTableViewPullHeaderFooter=4
} JSTableViewState;

static NSString *const KSWIdentifier=@"JSTableViewController";


/*

tableview 集成功能（暂时不考虑分组）

①： 集成自定义tableViewHeader 和 tableViewFooter (v)

②： 集成自定义Cell，并且赋值即可 （协议） (v)

③： 集成MJ(v)

④： 集成空View (v)

⑤： 集成上拉弹簧 (v)

 */

@interface JSTableViewController : UITableViewController



@property(nonatomic,assign)NSInteger pageIndex;//页码

@property(nonatomic,weak)id<JSTableViewControllerDelegate> delegate;//代理

@property(nonatomic,strong)NSMutableArray *date;//数据源


@property(nonatomic,weak)id<JSTableViewCellDelegate> JSTableViewCellDelegate;//cell代理方法


#pragma mark - 是否每次进入页面加载一次网络请求
@property(nonatomic,assign)BOOL IsEveryLoading;// 是否只加载一次;



#pragma mark - 头部是否拉伸 HFStretchableTableHeaderView
@property(nonatomic,strong) JSStretchableTableHeaderView *stretchHeaderView;



//初始化方法
- (instancetype)initWithState:(JSTableViewState)state tableViewCellClass:(Class) cellclass delegate:(id<JSTableViewControllerDelegate>)delegate;



@end




@protocol JSTableViewControllerDelegate <NSObject>


// 网络加载
-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage;

//点击事件
-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


//高度
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;


#pragma mark --------直接加头部和底部View-----------------

-(UIView *)JSTableViewControllerWithViewForTableFooterView ;
-(UIView *)JSTableViewControllerWithViewForTableHeaderView;



#pragma mark -------分组头部-----------

-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section;

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForHeaderInSection:(NSInteger)section;


#pragma mark -------分组底部-----------
-(UIView *)JSTableViewController:(JSTableViewController *)JSCtrl viewForFooterInSection:(NSInteger)section;
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl  heightForFooterInSection:(NSInteger)section;




@end








