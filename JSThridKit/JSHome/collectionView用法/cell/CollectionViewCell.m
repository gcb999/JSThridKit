//
//  CollectionViewCell.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/24.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    self.backgroundColor=indexpath.item%2==0?[UIColor yellowColor]:[UIColor redColor];
    
}
@end
