//
//  JSCollectionViewController+CollectionView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController+CollectionView.h"

@implementation JSCollectionViewController (CollectionView)



#pragma mark - collection数据源代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // 设置尾部控件的显示和隐藏
    //    self.collectionView.footer.hidden = self.date.count == 0;
    
    if (self.date.count==0) {
        self.collectionView.footer.hidden=YES;
        return 0;
    }
    
    return self.date.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.CollectionViewCellDelegate = [collectionView dequeueReusableCellWithReuseIdentifier:SWCollectionViewCellIdentifier forIndexPath:indexPath];
    id content=self.date[indexPath.item];
    [self.CollectionViewCellDelegate  JSCollectionViewController:self collectionViewDateArr:self.date cellValue:content indexPath:indexPath];
    return (UICollectionViewCell *)self.CollectionViewCellDelegate;
  
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ( self.delegate && [self.delegate respondsToSelector:@selector(JSCollectionViewController:didSelectRowAtIndexPath:)]) {
        [self.delegate JSCollectionViewController:self didSelectRowAtIndexPath:indexPath];
    }
    
}


#pragma mark --UICollectionViewDelegateFlowLayout

////定义每个UICollectionView 的大小
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//    if ( self.delegate &&  [self.delegate respondsToSelector:@selector(JSCollectionViewController:heightForRowAtIndexPath:)]) {
//
//       return  [self.delegate JSCollectionViewController:self heightForRowAtIndexPath:indexPath];
//    }
//
//    else{
//        if (self.flowLayout) {
//            return CGSizeZero;
//        }
//        else{
//            return CGSizeMake(IPHONScreenWidth*0.5f-5, 80);//一排两个
//            
//        }
//    }
//
//
//}



//头部和底部view

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        
        self.HeaderFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SWCollectionHeaderIdentifier forIndexPath:indexPath];

    }
    else if (kind==UICollectionElementKindSectionFooter){
       self.HeaderFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SWCollectionFooterIdentifier forIndexPath:indexPath];

    }
 
    [self.HeaderFooterCollectionViewDelegate JSCollectionViewController:self collectionViewDateArr:self.date indexPath:indexPath];
        
    reusableview =(UICollectionReusableView *) self.HeaderFooterCollectionViewDelegate;
    
    
    return reusableview;
    

    
}

//返回头部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(JSCollectionViewController:layout:referenceSizeForHeaderInSection:)]) {

        return [self.delegate JSCollectionViewController:self layout:collectionViewLayout referenceSizeForHeaderInSection:section];
    }
    else{
        
       return CGSizeZero;
        
    }
}

//返回底部的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (self.delegate && [self.delegate respondsToSelector:@selector(JSCollectionViewController:layout:referenceSizeForFooterInSection:)]) {
        
        return  [self.delegate JSCollectionViewController:self layout:collectionViewLayout referenceSizeForFooterInSection:section];
    }
    else{
        
        return CGSizeZero;
    }
}

#pragma mark -刷新MJ头部



-(void)reloadHeader{
    
    [self.collectionView cyl_reloadData];
    [self.collectionView.header endRefreshing];
    
}

#pragma mark -刷新MJ尾部
-(void)reloadFooter{
    
    [self.collectionView cyl_reloadData];
    [self.collectionView.footer endRefreshing];
    
}

#pragma mark -刷新数据
-(void)reloadDate{
    [self.collectionView reloadData];
}


#pragma mark -隐藏头部
-(void)hiddenFooter{
    
    self.collectionView.footer.hidden=YES;
}

#pragma mark -添加头部
-(void)showFooter{
    
    //    [self TableViewFooter];
    
    self.collectionView.footer.hidden=NO;
}



@end
