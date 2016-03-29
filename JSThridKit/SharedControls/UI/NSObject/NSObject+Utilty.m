//
//  NSObject+Utilty.m
//  HGMobile
//
//  Created by zy on 13-2-20.
//
//

#import "NSObject+Utilty.h"


UIColor * rgb(int r, int g, int b)
{
	return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
}

UIColor * rgbA(int r, int g, int b, float a)
{
	return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

UIColor * rgbweb(int rgbval)
{
    return rgb((rgbval>>16)&0xFF,(rgbval>>8)&0xFF,(rgbval>>0)&0xFF);
}


@implementation NSObject (Utilty)

-(NSString*)readApiCacheFileName:(NSString*)fileName{
    NSString * cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheFolder = [cacheFolder stringByAppendingPathComponent:@"JiangSu"];
    
    //获取文件路径
    NSString *path = [cacheFolder stringByAppendingPathComponent:fileName];

   return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}

/*
 *  @fileName   需要保存的文件名字
 */
-(void)saveApiCacheFileName:(NSString*)fileName textContent:(NSString*)content Append:(BOOL)isAppend{
//    if ([content rangeOfString:@"["].location != NSNotFound && [content rangeOfString:@"]"].location != NSNotFound) {
//        content = [[[[content componentsSeparatedByString:@"["] objectAtIndex:1] componentsSeparatedByString:@"]"] objectAtIndex:0];
//    }
//    content = [NSString stringWithFormat:@",%@",content];
    
    NSString * cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheFolder = [cacheFolder stringByAppendingPathComponent:@"JiangSu"];
    
    NSFileManager * fmgr = [NSFileManager defaultManager];

    if (![fmgr fileExistsAtPath:cacheFolder])
    {
        NSError * error;
        [fmgr createDirectoryAtPath:cacheFolder withIntermediateDirectories:YES attributes:nil error:&error];
    }
    cacheFolder = [cacheFolder stringByAppendingPathComponent:fileName];
    
    
//    if (isAppend == NO) {

        if ([content writeToFile:cacheFolder atomically:YES encoding:NSUTF8StringEncoding error:NULL] == YES) {
            NSLog(@"保存成功");
        }
    
//    }else{
//       
//        NSLog(@"追加内容到 :%@",cacheFolder);
//        if (![fmgr fileExistsAtPath:cacheFolder])
//        {
//            NSLog(@"目录:%@ 不存在",cacheFolder);
//            if ([@"" writeToFile:cacheFolder atomically:YES encoding:NSUTF8StringEncoding error:NULL] == YES) {
//                NSLog(@"保存成功");
//            }
//        }
//        NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:cacheFolder];
//        if (outFile == nil) {
//            NSLog(@"Open of file for writing failed");
//        }
//        
//        [outFile seekToEndOfFile]; // 找到并定位到outfile的尾端位置
//        [outFile writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
//        [outFile closeFile];
//        
//    }
    
    
}

-(NSString*)filterString:(NSString*)aString filterWith:(NSString*)fStr{
    
    aString = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([aString rangeOfString:fStr].location != NSNotFound) {
        aString = [aString stringByReplacingOccurrencesOfString:fStr withString:@""];
        [self filterString:aString filterWith:fStr];
    }
    return aString;
}

/*
 *  检查输入的金额是否符合金额的输入规则
 *
 */
-(bool)doCheckInputAmount:(NSString *)textFieldtext replacementString:(NSString *)string
{
	int length_f = [textFieldtext length];
	
	if([string length]>1)
		return FALSE;
	if(![string isEqualToString:@"."]&& [textFieldtext length]){
		if ([textFieldtext length]>=16 && ![string isEqualToString:@""] ) {
			return FALSE;
		}
		
	}
	if( [string isEqualToString:@""] )
		return TRUE;
	// 判断输入字符[是否合格]
	unichar curChar_f = [string characterAtIndex:0];
	if( (curChar_f>='0'&&curChar_f<='9') || (curChar_f=='.') )
	{
		if( curChar_f=='.' )
		{
			if(length_f==0)			//	首字节不能为.
				return FALSE;
			if( [textFieldtext rangeOfString:@"."].length>0 )	// .不能重复
				return FALSE;
		}
		if(length_f>0)
		{
			if( [textFieldtext characterAtIndex:0]=='0' )		// 如果首输入为0，第二必须为.
			{
				if( curChar_f!='.'&& length_f==1 )
				{
					return FALSE;
				}
			}
		}
		
		if( length_f>=3 )
		{
			// 小数点后2位不能在输入
			if( [textFieldtext characterAtIndex:length_f-3]=='.' )
				return FALSE;
		}
		return TRUE;
	}
	
	return FALSE;
}



@end


@implementation NSDictionary (extra)


//根据key值的到字典中的object
- (id)getObjectByKey:(NSString*)key {
	NSArray *array = [key componentsSeparatedByString:@"/"];
	NSDictionary *dic = self;
	for (int i=0; i<[array count]-1; i++) {
		dic = [dic objectForKey:[array objectAtIndex:i]];
	}
	return [dic objectForKey:[array objectAtIndex:[array count]-1]];
}

/*
 根据key值得到字符串，如为空则返回@“”
 */
- (id)getStringByKey:(NSString*)key {
	NSArray *array = [key componentsSeparatedByString:@"/"];
	NSDictionary *dic = self;
	for (int i=0; i<[array count]-1; i++) {
		dic = [dic objectForKey:[array objectAtIndex:i]];
	}
	NSString *temp = [dic objectForKey:[array objectAtIndex:[array count]-1]];
	if (!temp) {
		temp = @"";
	}
	return temp;
}

/*
 根据key值把字典中的list字典转换成数组
 使用方法：NSArray *array = [self getArrayByString:@"Data/responseBody/eventList"];
 */
- (NSMutableArray*)getArrayByString:(NSString*)string  {
    NSDictionary *dic = [self getObjectByKey:string];
	
	NSMutableArray *array = [[NSMutableArray alloc] init];
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        NSArray *keys = [dic allSortedKeys];
        for (int i=0; i<[keys count]; i++) {
            NSString *key = [keys objectAtIndex:i];
            [array addObject:[dic objectForKey:key]];
        }
    }
	return array;
}


/*
 根据参数返回排序的keys
 */
- (NSArray*)sortedKeysByString:(NSString*)elementName {
	NSMutableArray *array = [NSMutableArray array];
	for (int i=0; i<[[self allKeys] count]; i++) {
        if (i == 0) {
            [array addObject:[NSString stringWithFormat:@"%@", elementName]];
            continue;
        }
		[array addObject:[NSString stringWithFormat:@"%@%d", elementName, i]];
	}
	return array;
}

/*
 对key进行排序，替代[dic allKeys]，对keys进行排序
 */
- (NSArray *)allSortedKeys {
	if ([self objectForKey:@"ITEM"]) {
		NSMutableArray *array = [NSMutableArray array];
		[array addObject:@"ITEM"];
		for (int i=1; i<[[self allValues] count]; i++) {
			[array addObject:[NSString stringWithFormat:@"ITEM%d", i]];
		}
		return array;
	}
	else if ([self objectForKey:@"ITEM"]) {
		NSMutableArray *array = [NSMutableArray array];
		[array addObject:@"ITEM"];
		for (int i=1; i<[[self allValues] count]; i++) {
			[array addObject:[NSString stringWithFormat:@"ITEM%d", i]];
		}
		return array;
	}
	return [self allKeys];
}



@end


@implementation NSString (chnbs)


-(void)saveApiCacheFileName:(NSString*)fileName{
    
    NSString * cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheFolder = [cacheFolder stringByAppendingPathComponent:@"JiangSu"];
    
    NSFileManager * fmgr = [NSFileManager defaultManager];
    if (![fmgr fileExistsAtPath:cacheFolder])
    {
        NSError * error;
        [fmgr createDirectoryAtPath:cacheFolder withIntermediateDirectories:YES attributes:nil error:&error];
    }
    cacheFolder = [cacheFolder stringByAppendingPathComponent:fileName];
    [self writeToFile:cacheFolder atomically:YES encoding:NSUTF8StringEncoding error:NULL];
}

@end

