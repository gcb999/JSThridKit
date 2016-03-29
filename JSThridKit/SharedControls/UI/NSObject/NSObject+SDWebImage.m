//
//  NSObject+SDWebImage.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSObject+SDWebImage.h"

@implementation NSObject (SDWebImage)



    
#define KBANNER_ERROR_IMGURL  @""
    
#define KBIGPRODUCT_ERROR_IMGURL  @""
    
#define KMIDDLEPRODUCT_ERROR_IMGURL  @""
    
#define KSMALLPRODUCT_ERROR_IMGURL  @""
    


//banner

-(void)loadingBannerPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview{
    
    
    //商品图片
    [imgview sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:KBANNER_DEAFAULT_IMGURL] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            imgview.image=[UIImage imageNamed:KBANNER_ERROR_IMGURL];
        }
    }];
}


//大图

-(void)loadingBigPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview{
    
    //商品图片
    [imgview sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:KBIGPRODUCT_DEAFAULT_IMGURL] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            imgview.image=[UIImage imageNamed:KBIGPRODUCT_ERROR_IMGURL];
        }
    }];
}



//中图
-(void)loadingMiddlePlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview{
    
    //商品图片
    [imgview sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:KMIDDLEPRODUCT_DEAFAULT_IMGURL] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            imgview.image=[UIImage imageNamed:KMIDDLEPRODUCT_ERROR_IMGURL];
        }
    }];
}




//小图

-(void)loadingSmallPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview{
    
    //商品图片
    [imgview sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:KSMALLPRODUCT_DEAFAULT_IMGURL] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            imgview.image=[UIImage imageNamed:KSMALLPRODUCT_ERROR_IMGURL];
        }
    }];
}


#pragma mark -加载图片信息默认大小

-(void)loadingImageName:(NSString *)imageName imgview:(UIImageView *)imgview{

    
    NSURL *URL=[NSURL URLWithString:imageName];
    
//    [HUD showLoadingHUDWithText:@"" inView:imgview];
    SDWebImageManager *mangaer=[SDWebImageManager sharedManager];
    [mangaer downloadImageWithURL:URL options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (expectedSize > 0 && receivedSize > 0) {
           CGFloat progress = (CGFloat)receivedSize / expectedSize;
            NSLog(@"--%f",progress);
    }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (!error) {
            
//            [HUD hideHUD];
            imgview.image=image;
        }
        
        
    }];

}



@end
