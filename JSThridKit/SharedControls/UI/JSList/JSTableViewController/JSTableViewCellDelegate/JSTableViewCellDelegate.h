//
//  BaseTableViewCellDelegate.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/21.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSTableViewCellDelegate <NSObject>

-(void)JSTableViewController:(JSTableViewController *)JSCtrl   TableViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath;



@end
