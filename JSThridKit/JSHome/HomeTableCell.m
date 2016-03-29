//
//  HomeTableCell.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/18.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HomeTableCell.h"

@implementation HomeTableCell



-(void)JSTableViewController:(JSTableViewController *)SWCtrl TableViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    self.textLabel.text=date;
}

@end
