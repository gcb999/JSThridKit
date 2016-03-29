//
//  BaseFlowLayout.h
//  ThrIdVerson
//
//  Created by gcb999 on 15/11/6.
//  Copyright © 2015年 gcb99. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseFlowLayout : UICollectionViewFlowLayout

/*
 layoutItemsize  item的大小
 
 */
@property(nonatomic,assign)CGSize  layoutItemsize;


/*
 
layoutSectionInset 间距
 
 */
@property(nonatomic,assign)UIEdgeInsets layoutSectionInset;


/*
 
layoutMinimumLineSpacing 设置了每个item在水平（横着）方向上的最小间距
 

 */

@property(nonatomic,assign)CGFloat  layoutMinimumLineSpacing;

/*
 
 layoutMinimumInteritemSpacing 设置了每个item在垂直（竖着）方向上的最小间距

 */


@property(nonatomic,assign)CGFloat layoutMinimumInteritemSpacing;


/*

layoutScrollDirection 设置其布局方向
 
 */


@property(nonatomic,assign)UICollectionViewScrollDirection layoutScrollDirection;



- (instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)scrollDirection itemSize:(CGSize)itemsize;


#pragma mark -获取可见矩形（屏幕）最中间的X

-(CGFloat)ScreenMiddleX;

#pragma mark - UICollectionView/UIScrollView /UITableView可见矩形（屏幕）区域

-(CGRect)VisiableRect;


#pragma mark-计算一排能放Item的个数

-(NSInteger)ItemCount;
@end


