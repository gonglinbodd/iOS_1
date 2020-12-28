//
//  SMBaseCommon.h
//  SMBase
//
//  Created by smwl on 2020/5/6.
//  Copyright © 2020 smwl. All rights reserved.
//

#ifndef SMBaseCommon_h
#define SMBaseCommon_h

//尺寸比例
#define SizePecent 0.34
#define DEVICES_IS_PRO_12_9 ([UIScreen mainScreen].bounds.size.width == 1024)
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)
#define KWIDTH (IPAD ? (CurrentWidth > CurrentHeight ? CurrentHeight : CurrentWidth)/750 : (CurrentWidth > CurrentHeight ? CurrentHeight : CurrentWidth)/375)
#define newKWIDTH (CurrentHeight>CurrentWidth ? CurrentWidth: CurrentHeight)/375
#define kBannerHeight 200*newKWIDTH
#define NavHeight     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64) // 适配iPhone x
#define BottomiPhoneMax     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?24:0) // 适配iPhone x 多34
#define DCHeight [[UIApplication sharedApplication] statusBarFrame].size.height////电池高度

//是否是ipad。是iPad比例c乘以1.5倍，不是则直接按照屏幕比例是配
#define SMSIZEBILI (IPAD ? SizePecent*1.5 : SizePecent*newKWIDTH)
#define SMBili   1.77778

#define AutoWidthSize(str,zsize)   [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:zsize]} context:nil].size.width
#define kSearchbarHeight        53
#define kSlideHeight        180*SMSIZEBILI
// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iOS_11 @available(iOS 11.0,*)
#define UIColorFromRGB(rgbValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]

#define newSizePecent 375/1080

///////1、导航栏
#define TabbarHeight     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?73+6:49+6) // 适配iPhone x 底栏高度 83:49
#define NavHeight     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64) // 适配iPhone x
#define TopiPhoneMax     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?24:0) // 适配iPhone x 多24
#define BottomiPhoneMax     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?24:0) // 适配iPhone x 多34
#define SpaceToTop     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0) // 适配iPhone x 多34

//文本size
#define AutoHeightSize(str,with,zsize)   [str boundingRectWithSize:CGSizeMake(with, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:zsize]} context:nil].size.height

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////        宏定义       ////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define StringWithData(data) [[NSString alloc] initWithData:(data) encoding:NSUTF8StringEncoding]
#define DataWithString(str) [(str) dataUsingEncoding:NSUTF8StringEncoding]

/* debug和release设置 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#ifndef SMLog
#define SMLogF(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#ifdef DEBUG
#define SMLog(format, ...) SMLogF(format, ##__VA_ARGS__);
#else
#define SMLog(format, ...) while(0){}
#endif
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define SM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define SM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

//延时宏
#define DELAYED(time, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block)

//发送通知宏
#define POST_NOTIFICATION1(name)    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:name object:nil]];
#define POST_NOTIFICATION2(name, obj)    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:name object:obj]];
#define POST_NOTIFICATION3(name, userInfo)    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:name object:nil userInfo:userInfo]];
#define POST_NOTIFICATION4(name, obj, userInfo) [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:name object:obj userInfo:userInfo]]

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]


//统计代码执行时间
#define START NSDate *startTime = [NSDate date]
#define END SMLog(@"func=%s Time: %f", __func__, -[startTime timeIntervalSinceNow])
#define END2(desc)  SMLog(@"func=%s Time: %f(%@)", __func__, -[startTime timeIntervalSinceNow], desc)

#define NSLocalizedString_SM(key, nil)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]

#define  faloatWindow        [UIApplication sharedApplication].keyWindow

//状态栏高度
#define FloatStatusBarHeight (iPhoneX ? 44.f : 20.f)


#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) \
|| CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size)   \
|| CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size)   \
|| CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size))

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IOS_11  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.f)
#define IS_IPHONE_X (IS_IOS_11 && IS_IPHONE && (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 812))
#define SizeForIpad 0.5

#define MAIN(block) dispatch_async(dispatch_get_main_queue(), block)


//Network API
#define BUY_ENCRYSTRING @"IOSDFASJ!@46216#$%^FGHF&*()_+(*^%4564#$#V65S16F4FTH][PKPEPJOJ][P[];340"   //buy.x7sy.com 加密串

#define EncryptedString @"oijsdivsdhfdfposdpfgkpasdjfosm854564sd9f46sd4f98df9416wer6w1e6f1s6"       //hgame.x7sy.com 加密串
#define HGAME_ENCRYSTRING @"IOSH*^&^$%54SDFSsdsdtg^&*(PKL><>LPJKJ_+()90-08r458^&*^$%^#^&#$#$%&&*(&"       //hgame.x7sy.com 新加密串

#define URL_ENCODECODE  @"yutjfghdsts545d1fg5ds21g5d1fdf12fg1df531a"                                //market.x7sy.com 加密串
#define New_ENCRYSTRING @"IOSM@#$$%^SDGSDFSDflsjdfohfsFSDGsdfksjefdsd$%^%&56745345#$%#^DFGDFGSsd"   //market.x7sy.com 新 加密串
#define USER_ENCRYSTRING @"IOSU<>?/;:+_)*(&*$%#@)#$%#)^$@!)(_684)_+89443klj546437$@#$!$@^(*-77278"   //用户中心新加密串
#define PAY_ENCRYSTRING @"IOSPIU!@#$%^&*^%#*()_+-='/?.,<>8145adfsdsHKUNHIUHIUHKLJO!@#$%^#$#$%$%^"

#define UPLOAD_ENCRYSTRING @"Market_cA#@Z^&zqJ2%T&l&c9UU!xDK7jvCpS4H5eN!ugCbX@bQKqoLVK3R43pXqfBY"        //上传图片加密串
//#define FIRST_IN @"iOSP!@#@#$#$^$&%^&^*&%$%JNOISJDFnjkndiosn5151#$%%^$&#$%#<>??L:{}[]"
//用户数据加密字符串，4.1账号互通
#define USER_SECRET_KEY                     @"rLsPAn@a=x4qTxaX(j$*gC]YTHVeW^zI"

//2019 12.5
#define CURRENCY_ENCRYSTRING   @"ZnJPv%mlSFTWQYGHN#yrgQ4&BlTV5X"//通用加密串（不知道为什么，后台说通用的）

//2020 03.16
#define HEADER_INFORMATION_ENCRYSTRING   @"e^Jjt5sO^NvuoYc8Qs&b^ST^pMTRfYdiMrVq2qPNMcH!pBEq9xl5JS3D!sP3L4*5"//头信息新增的key的加密串

#define auth_string  @"auth_string"

#endif /* SMBaseCommon_h */
