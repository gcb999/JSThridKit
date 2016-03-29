//
//  SWCollectionViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionViewController.h"


@interface JSCollectionViewController ()
{
    
    JSCollectionViewState _state;//MJ
    
    BOOL _isFirstLoadPage;//是否第一进入页面
    
    
}

//cell 类
@property(nonatomic,readonly)Class collectionCellClass;

// header 类
@property(nonatomic,readonly)Class headerViewClass;

// footer 类
@property(nonatomic,readonly)Class footerViewClass;

@end

@implementation JSCollectionViewController

//正常
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:nil footerViewClass:nil];
        
    }
    return self;
}

//头部

- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass
{

    return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:headerViewClass   footerViewClass:nil];
}


//底部
- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  footerViewClass:(Class) footerViewClass
{
    return  [self  initWithState:state CollectionViewCellClass:cellclass delegate:delegate HeaderViewType:nil footerViewClass:footerViewClass];
}

//头部和底部

- (instancetype)initWithState:(JSCollectionViewState)state CollectionViewCellClass:(Class) cellclass delegate:(id<JSCollectionViewControllerDelegate>)delegate  HeaderViewType:(Class) headerViewClass  footerViewClass:(Class) footerViewClass
{
    self = [super init];
    if (self) {
        self.date=[NSMutableArray array];
        _state=state;
      
        _collectionCellClass=cellclass;
        self.delegate=delegate;
        if (headerViewClass) {
             _headerViewClass=headerViewClass;
        }
        if (footerViewClass) {
            _footerViewClass=footerViewClass;
        }
       
        
        
    }
    return self;
}





#pragma mark 设置流水瀑布




- (void)viewDidLoad {
    [super viewDidLoad];
   

    _isFirstLoadPage=YES;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor=KCOLOR_WHITE;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.scrollEnabled=YES;
    _collectionView.showsVerticalScrollIndicator=NO;
    
     [self setUpMJRefresh:_state];
    
    //cell
    
    [self.collectionView registerClass:self.collectionCellClass forCellWithReuseIdentifier:SWCollectionViewCellIdentifier];
    
    //头部
    if (self.headerViewClass) {
        [self.collectionView registerClass:self.headerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SWCollectionHeaderIdentifier];
        
    }
    
    //底部
    if (self.footerViewClass) {
        [self.collectionView registerClass:self.footerViewClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SWCollectionFooterIdentifier];
    }
    
    
    [self.view addSubview:_collectionView];
    
    
}

//切换布局
-(void)setFlowLayout:(UICollectionViewLayout *)flowLayout{
    
    [_collectionView setCollectionViewLayout:flowLayout animated:YES];
    
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(_isFirstLoadPage==YES){//第一次进入界面
        
        self.pageIndex=1;
        
        
        if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
            [self.collectionView.header beginRefreshing];
        }
        else{
            [self loadNewData];
            
        }
        _isFirstLoadPage=NO;
        
    }
    else{//再次进入界面
        
        if (self.IsEveryLoading) {
            if ([self.collectionView.header respondsToSelector:@selector(beginRefreshing)]) {
                [self.collectionView.header beginRefreshing];
            }
            else{
                [self loadNewData];
                
            }
        }
        
        
    }
    
    
}





@end

