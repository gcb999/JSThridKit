//
//  BaseFlowLayout.m
//  ThrIdVerson
//
//  Created by gcb999 on 15/11/6.
//  Copyright © 2015年 gcb99. All rights reserved.
//

#import "BaseFlowLayout.h"


@implementation BaseFlowLayout

/*
 1: itemSize  item的大小
 
 2: sectionInset 间距
 
 3：minimumInteritemSpacing 设置了每个item在垂直（竖着）方向上的最小间距
 
 4：minimumLineSpacing 设置了每个item在水平（横着）方向上的最小间距
 
 5：ScrollDirection 设置其布局方向
 


 
 
 */
- (instancetype)init
{
    self = [super  init];
    if (self) {
        
        self.layoutItemsize=CGSizeMake(60, 60);
        self.layoutSectionInset=UIEdgeInsetsMake(5, 5, 5, 5);
        self.layoutMinimumLineSpacing=5;
        self.layoutMinimumInteritemSpacing=5;
        self.layoutScrollDirection=UICollectionViewScrollDirectionVertical;
    }
    return self;
}


- (instancetype)initWithScrollDirection:(UICollectionViewScrollDirection)scrollDirection itemSize:(CGSize)itemsize
{
    self = [self init];
    if (self) {

        self.layoutScrollDirection=scrollDirection;
        self.layoutItemsize=itemsize;
    }
    return self;
}

/**
 
 1: 只要显示边界发生变化就重新布局
 
 2： 内部会调用prepareLayout 和
 
 **/
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{

    return YES;
    
}

/**
 *  一些初始化工作最好在这里实现
 */
#pragma mark -准备加载

-(void)prepareLayout{
    [super prepareLayout];

    //每个Cell的尺寸
    self.itemSize = CGSizeMake(IPHONScreenWidth *0.5f-15, 100);
    
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.sectionInset=UIEdgeInsetsMake(5, 2.5, 2.5, 5);

    
   
    
    self.minimumInteritemSpacing=self.layoutMinimumInteritemSpacing;

    self.minimumLineSpacing=self.layoutMinimumLineSpacing;


    
    if (self.scrollDirection==UICollectionViewScrollDirectionVertical) {//竖着
        self.collectionView.showsVerticalScrollIndicator=YES;
        self.collectionView.showsHorizontalScrollIndicator=NO;
    }
    else{
        self.collectionView.showsVerticalScrollIndicator=YES;
        self.collectionView.showsHorizontalScrollIndicator=NO;
    }

    
}


/**
 *  用来设置collectionView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
 *  @param velocity              滚动速度
 */
//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//    // 1.计算出scrollView最后会停留的范围
//    CGRect lastRect;
//    lastRect.origin = proposedContentOffset;
//    lastRect.size = self.collectionView.frame.size;
//    
//    // 计算屏幕最中间的x
//    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
//    
//    // 2.取出这个范围内的所有属性
//    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
//    
//    // 3.遍历所有属性
//    CGFloat adjustOffsetX = MAXFLOAT;
//    for (UICollectionViewLayoutAttributes *attrs in array) {
//        if (ABS(attrs.center.x - centerX) < ABS(adjustOffsetX)) {
//            adjustOffsetX = attrs.center.x - centerX;
//        }
//    }
//    
//    return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y);
//}


#pragma mark - UICollectionView/UIScrollView /UITableView可见矩形（屏幕）区域

-(CGRect)VisiableRect{
   
    CGRect VisiableRect;
    VisiableRect.size=self.collectionView.bounds.size;
    VisiableRect.origin=self.collectionView.contentOffset;
    return VisiableRect;
    
}

#pragma mark -获取可见矩形（屏幕）最中间的X

-(CGFloat)ScreenMiddleX{
    
    return self.collectionView.contentOffset.x+self.collectionView.bounds.size.width*0.5f;
}


#pragma mark-计算一排能放Item的个数

-(NSInteger)ItemCount{
 
    
    /* 计算个数公式---UICollectionViewScrollDirectionVertical 竖着
     
     itemWith *x  + （self.sectionInset.left+self.sectionInset.righ）+ （x+1)*self.minimumInteritemSpacing= UIConllectionView的宽度
     
     */
    
    /* 计算个数公式---UICollectionViewScrollDirectionHorizontal  横着
     
     itemWith *x  + （self.sectionInset.left+self.sectionInset.righ）+ （x+1)*minimumLineSpacing= UIConllectionView的宽度
     
     */
    
    // selection 左右两边边距
    CGFloat margin= self.sectionInset.left+self.sectionInset.right;
    
    //item size的宽度
    CGFloat itemWidth=self.itemSize.width;
    
    CGFloat GroupCellWidth=self.collectionView.bounds.size.width-margin-self.minimumLineSpacing;
    
    //实际个数
    CGFloat num=0.0f;
    if (self.scrollDirection==UICollectionViewScrollDirectionVertical) {//竖着
     
        
        /* 公式
         itemWith *x  + （self.sectionInset.left+self.sectionInset.righ）+ （x+1)*self.minimumInteritemSpacing= UIConllectionView的宽度
         
         */
        
        num=(self.collectionView.bounds.size.width-margin)/(itemWidth+self.minimumInteritemSpacing);
        
        //整数数目
        int count=(int)num+1;
        
        if((GroupCellWidth-(count)*itemWidth)/(count+1)>=self.minimumInteritemSpacing){
            
        }
        else{
            
            count=count-1;
            
        }
        return count;
        
    }
    else{//横着
        
        num=(GroupCellWidth)/(itemWidth+self.minimumLineSpacing);
        
        int count=(NSInteger)num+1;
        //验证
        
        if((GroupCellWidth-(count)*itemWidth)/(count+1)>=self.minimumInteritemSpacing){
           
        }
        else{
            
            count=count-1;
        }
        return count;
        
    }
    

}
@end
