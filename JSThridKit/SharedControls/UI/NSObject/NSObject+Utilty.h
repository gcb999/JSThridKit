//
//  NSObject+Utilty.h
//  HGMobile
//
//  Created by zy on 13-2-20.
//
//

#import <Foundation/Foundation.h>


UIColor * rgb(int r, int g, int b);
UIColor * rgbA(int r, int g, int b, float a);
UIColor * rgbweb(int rgbval);

@interface NSObject (Utilty)

// 读文件
-(NSString*)readApiCacheFileName:(NSString*)fileName;

// 写文件
-(void)saveApiCacheFileName:(NSString*)fileName textContent:(NSString*)content Append:(BOOL)isAppend;

//　字符串过滤不规则字符
-(NSString*)filterString:(NSString*)aString filterWith:(NSString*)fStr;


/*
 *  检查输入的金额是否符合金额的输入规则
 *
 */
-(bool)doCheckInputAmount:(NSString *)textFieldtext replacementString:(NSString *)string;


@end

@interface NSDictionary (extra)


//根据key值的到字典中的object
- (id)getObjectByKey:(NSString*)key;

//根据key值得到字符串，如为空则返回@“”
- (id)getStringByKey:(NSString*)key;

//根据key值把字典中的list字典转换成数组
- (NSMutableArray*)getArrayByString:(NSString*)string;

- (NSArray*)sortedKeysByString:(NSString*)elementName;




@end


@interface NSString (chnbs)

-(void)saveApiCacheFileName:(NSString*)fileName;



@end