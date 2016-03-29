//
//  CollectionHeaderView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/24.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "CollectionHeaderView.h"

@implementation CollectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *lb=[UILabel LabWithFrame:self.bounds text:@"添加头部" textColor:[UIColor whiteColor] textAlign:NSTextAlignmentCenter font:KSMALL_FONT_SIZE];
        lb.backgroundColor=[UIColor blackColor];
        [self addSubview:lb];
    }
    return self;
}


-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr indexPath:(NSIndexPath *)indexpath{
    
    
}
@end
