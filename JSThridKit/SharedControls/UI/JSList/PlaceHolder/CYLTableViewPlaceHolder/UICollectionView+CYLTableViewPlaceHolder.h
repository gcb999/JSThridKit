//
//  UICollectionView+CYLTableViewPlaceHolder.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (CYLTableViewPlaceHolder)

/*!
 @brief just use this method to replace `reloadData` ,and it can help you to add or remove place holder view automatically
 @attention this method has already reload the tableView,so do not reload tableView any more.
 */
- (void)cyl_reloadData;

@end
