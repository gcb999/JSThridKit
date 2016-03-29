//
//  NSMutableAttributedString+CBAttributedString.m
//  DressLink
//
//  Created by gcb999 on 15/11/16.
//  Copyright © 2015年 com.sailvan.technology. All rights reserved.
//

#import "NSMutableAttributedString+CBAttributedString.h"

@implementation NSMutableAttributedString (CBAttributedString)



-(NSMutableAttributedString *)AttributedStringWithtitle:(NSString *)title  Font:(UIFont *)font  color:(UIColor *)color  isShowUnderlineStyle:(BOOL)UnderlineStyle isStrikethroughStyle:(BOOL)StrikethroughStyle{
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = NSMakeRange(0,string.length);
    
    
    //字型
    [string addAttribute:NSFontAttributeName value:font range:range];
    
    //背景顏色
    [string addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    
    //下划线
    if (UnderlineStyle) {
        
        [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:range];
    }
    
    //底线
    if (StrikethroughStyle) {
        
            [string addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:1] range:range];
    }
       return string;
    
}


-(NSMutableAttributedString *)AttributedStringWithtitle:(NSString *)title  Range:(NSRange)mrange  Font:(UIFont *)font  color:(UIColor *)color  bgColor:(UIColor *)bgcolor isShowUnderlineStyle:(BOOL)UnderlineStyle isStrikethroughStyle:(BOOL)StrikethroughStyle{
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range =mrange;
    
    
    //字型
    [string addAttribute:NSFontAttributeName value:font range:range];
    
    //顏色
    [string addAttribute:NSForegroundColorAttributeName value:color range:range];
    
     //背景顏色
      [string addAttribute:NSBackgroundColorAttributeName value:bgcolor range:range];
    
    //下划线
    if (UnderlineStyle) {
        
        [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:range];
    }
    
    //底线
    if (StrikethroughStyle) {
        
        [string addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:1] range:range];
    }
    
    return string;
    
}

@end
