//
//  SWTableViewController+StretchableTableHeaderView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/21.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+StretchableTableHeaderView.h"

#define StretchHeaderHeight 200

@implementation JSTableViewController (StretchableTableHeaderView)

/**
 * subview:内容部分
 * view   :拉伸的背景图片view
 */
- (void)stretchHeaderImgUrl:(NSString *)imgUrl  subViews:(UIView*)subview{
    
    
    //背景图片
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, StretchHeaderHeight)];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    bgImageView.clipsToBounds = YES;
    bgImageView.image = [UIImage imageNamed:imgUrl];
    
    
    //背景之上的内容
    UIView *contentView = [[UIView alloc] initWithFrame:bgImageView.bounds];
    contentView.backgroundColor = [UIColor clearColor];
    
    //加子类
    [contentView addSubview:subview];
    
    
    /*
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = contentView.center;
    [contentView addSubview:avater];
    
     */
    
    self.stretchHeaderView = [[JSStretchableTableHeaderView alloc] init];
    [self.stretchHeaderView stretchHeaderForTableView:self.tableView withView:bgImageView subViews:contentView];
    
}

#pragma mark - stretchableTable delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.stretchHeaderView) {
        [self.stretchHeaderView scrollViewDidScroll:scrollView];
    }
    
}

- (void)viewDidLayoutSubviews
{
    if (self.stretchHeaderView) {
        [self.stretchHeaderView resizeView];
    }
    
}

@end


