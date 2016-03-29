//
//  SWTableViewController+StretchableTableHeaderView.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/21.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController.h"

//参考 https://github.com/ljhang/StretchHeader

@interface JSTableViewController (StretchableTableHeaderView)

/**
 * subview:内容部分
 * imgUrl   :拉伸的背景图片
 */
- (void)stretchHeaderImgUrl:(NSString *)imgUrl  subViews:(UIView*)subview;



@end
