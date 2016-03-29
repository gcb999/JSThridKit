
//
//  MacroHeader.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h




#pragma mark -------------------获取系统信息-------------------------



// 获取IPHONE 版本
#define IS_IPHONE4 ([UIScreen mainScreen].bounds.size.height == 480.f)

#define IS_IPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.f)

#define IS_IPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.f)

#define IS_IPHONE6_PLUS ([UIScreen mainScreen].bounds.size.height == 736.f)



//IPHONE 高度 和宽度

#define IPHONScreenWidth    [[UIScreen mainScreen] bounds].size.width

#define IPHONScreenHeight    [[UIScreen mainScreen] bounds].size.height


//获取设备系统版本 7.0
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 ?YES:NO

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define CURRENT_SYSTEM_VERSION ([[UIDevice currentDevice] systemVersion])


//读取bundle

#define BUNDLE_PATH_IMAGENAME(c) [[NSBundle mainBundle] pathForResource:c ofType:nil]


// App
#define APP_VERSION        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前语言
#define CURRENT_LANGUAGES ([[NSLocale preferredLanguages] objectAtIndex:0])





#pragma mark -------------------UIView的坐标坐标-------------------------



//get the left top origin's x,y of a view
#define VIEW_TOP_X(view) (view.frame.origin.x)//view 的x
#define VIEW_TOP_Y(view) (view.frame.origin.y)// view 的y


//get the width size of the view:width,height
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)

//get the right bottom origin's x,y of a view
#define VIEW_BOTTOM_X(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_BOTTOM_Y(view) (view.frame.origin.y + view.frame.size.height )


//get the x,y of the frame
#define FRAME_TOP_X(frame)  (frame.origin.x)
#define FRAME_TOP_Y(frame)  (frame.origin.y)

//get the size of the frame
#define FRAME_W(frame)  (frame.size.width)
#define FRAME_H(frame)  (frame.size.height)




#pragma mark -------------------字体-------------------------


//字体和字体大小

#define KFONT_NAME @"HelveticaNeue-Light"
//#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F] 
#define KBIG_FONT_SIZE  [UIFont systemFontOfSize:18]//大字体
#define KMIDDLE_FONT_SIZE  [UIFont systemFontOfSize:15]//中字体
#define KSMALL_FONT_SIZE  [UIFont systemFontOfSize:12]//小字体
#define KFont(f)  [UIFont systemFontOfSize:f]//



/*
大小屏字体自动切换有的应用希望有一个好的用户体验会在不同的屏幕上适配不同大小字体，这时就可以使用以下的宏定义来实现。但是如果应用中字体大小不能做到全局统一，就不要使用以下的宏定义来实现字体大小适配。这个就看你所开发的具体情况了

 */

#define IS_SmallScreen (IS_iPhone5 || IS_iPhone4)

#define MaxFontSize    (IS_SmallScreen ? 21.f : 25.f )
#define LagerFontSize  (IS_SmallScreen ? 17.f : 19.f )
#define BigFontSize    (IS_SmallScreen ? 15.f : 17.f )
#define NormalFontSize (IS_SmallScreen ? 13.f : 15.f )
#define SmallFontSize  (IS_SmallScreen ? 11.f : 13.f )
#define MinFontSize    (IS_SmallScreen ? 9.f  : 11.f )




#pragma mark ----------------------颜色类---------------------------


#define KCOLOR_MAIN   [UIColor orangeColor]
#define KCOLOR_BLACK  [UIColor blackColor]
#define KCOLOR_WHITE  [UIColor whiteColor]
#define KCOLOR_RED    [UIColor redColor]


// rgb颜色转换（16进制->10进制）
#define UICOLORFROMRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r,g,b) RGBA(r,g,b,1.0f)


//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]


//清除背景色
#define CLEARCOLOR [UIColor clearColor]




#pragma mark ----------------SDWebImage中背景图片和错误图片定制----------------


//错误背景图片
#define KBANNER_ERROR_IMGURL  @""

#define KBIGPRODUCT_ERROR_IMGURL  @""

#define KMIDDLEPRODUCT_ERROR_IMGURL  @""

#define KSMALLPRODUCT_ERROR_IMGURL  @""



//默认背景图片
#define KBANNER_DEAFAULT_IMGURL  @""

#define KBIGPRODUCT_DEAFAULT_IMGURL  @""

#define KMIDDLEPRODUCT_DEAFAULT_IMGURL  @""

#define KSMALLPRODUCT_DEAFAULT_IMGURL  @""




#pragma mark ---------------UI上的宏----------------



//获取UIImage  (建议使用前两种宏定义,性能高于后者)

#define IMAGE_CONTENT_FILE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]//读取本地图片


#define IMAGE_CONTENT_FILES(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]//定义UIImage对象


#define IMAGE_NAME(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]//定义UIImage对象


//获取delegate
#define APPDELEGATE [(AppDelegate*)[UIApplication sharedApplication] delegate]


//获取根控制器
#define ROOT_NAV_VC (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]



#pragma mark ---------------字符串---------------

#define STRING_WITH_FORMAT_INT(interger)       [NSString stringWithFormat:@"%ld",(long)(interger)]
#define STRING_WITH_FORMAT_FLOAT(float)        [NSString stringWithFormat:@"%f",(float)]



#pragma mark ---------------校验相关---------------

#define STRINGHASVALUE(str)  (str && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

//字符串
#define IS_NSString(str)     ((str != nil) && ![str isKindOfClass:[NSNull class]] && [str isKindOfClass:[NSString class]] && [str length] > 0 )

//数组
#define IS_NSArray(arr)      ( arr && (arr != nil) && ![arr isKindOfClass:[NSArray class]] )

//字典
#define IS_NSDictionary(dic)        ( dic && (dic != nil) && ![dic isKindOfClass:[NSDictionary class]] )

//NSNull
#define IS_NSNull(class)      [class isKindOfClass:[NSNull class]





#pragma mark ---------------获取沙盒的信息----------------

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]





//-------------------打印日志-------------------------
//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif






#endif /* MacroHeader_h */



