//
//  HudTableCell.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/30.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HudTableCell.h"

#import "HUD.h"
#import "UIImageView+RJLoader.h"

@interface HudTableCell ()

@property(nonatomic,strong)UIImageView *aimgview;
@property(nonatomic,strong)UIView *indicator;

@end


@implementation HudTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
     
        //图片
        self.aimgview=[UIImageView ImageViewImageName:@"" frame:CGRectMake(0, 0, 320, 120)];
        [self.contentView addSubview:self.aimgview];
        
        //滚动
        CGRect rect =self.aimgview .bounds;
         self.indicator=[[UIView alloc] initWithFrame:rect];
        self.indicator.backgroundColor=KCOLOR_RED;
         self.indicator.hidden=YES;
        self.indicator.center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
        [self.aimgview addSubview:self.indicator];
       
        
    }
    return self;
}


-(void)JSTableViewController:(JSTableViewController *)SWCtrl TableViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    NSURL *URL=[NSURL URLWithString:date];

    

   
    [self.aimgview sd_setImageWithURL:URL placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (expectedSize > 0 && receivedSize > 0) {
//            CGFloat progress = (CGFloat)receivedSize / expectedSize;
//            progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
            if (self.indicator.hidden) self.indicator.hidden = NO;
           
        }
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.indicator.hidden = YES;
  
       
;
    }];

  }


@end
