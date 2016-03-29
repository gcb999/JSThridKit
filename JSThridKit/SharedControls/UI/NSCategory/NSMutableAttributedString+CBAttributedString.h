//
//  NSMutableAttributedString+CBAttributedString.h
//  DressLink
//
//  Created by gcb999 on 15/11/16.
//  Copyright © 2015年 com.sailvan.technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (CBAttributedString)

-(NSMutableAttributedString *)AttributedStringWithtitle:(NSString *)title  Font:(UIFont *)font  color:(UIColor *)color  isShowUnderlineStyle:(BOOL)UnderlineStyle isStrikethroughStyle:(BOOL)StrikethroughStyle;

-(NSMutableAttributedString *)AttributedStringWithtitle:(NSString *)title  Range:(NSRange)mrange  Font:(UIFont *)font  color:(UIColor *)color  bgColor:(UIColor *)bgcolor isShowUnderlineStyle:(BOOL)UnderlineStyle isStrikethroughStyle:(BOOL)StrikethroughStyle;

@end
