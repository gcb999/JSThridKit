//
//  BaseHeaderFooterCollectionViewDelegate.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/21.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSCollectionViewHeaderFooterDelegate <NSObject>

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl   collectionViewDateArr:(NSArray *)dateArr indexPath:(NSIndexPath *)indexpath;
@end



#pragma mark -cell 的代理方法

@protocol JSCollectionViewCellDelegate <NSObject>

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl   collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath;
@end