//
//  NSObject+SDWebImage.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SDWebImage)


//banner(Placeholder)

-(void)loadingBannerPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview;


//大图(Placeholder)

-(void)loadingBigPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview;



//中图(Placeholder)
-(void)loadingMiddlePlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview;




//小图(Placeholder)

-(void)loadingSmallPlaceholderImageName:(NSString *)imageName  imgview:(UIImageView *)imgview;


#pragma mark -加载信息图片

-(void)loadingImageName:(NSString *)imageName imgview:(UIImageView *)imgview;

@end
