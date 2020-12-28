//
//  UIColor+Util.h
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;
+ (UIColor *)colorWithHexString:(NSString *)hexValue;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (UIColor *)themeColor;
+ (UIColor *)nameColor;
+ (UIColor *)titleColor;
+ (UIColor *)separatorColor;
+ (UIColor *)newCellColor;
+ (UIColor *)cellsColor;
+ (UIColor *)titleBarColor;
+ (UIColor *)titleBarButtonNormalColor;
+ (UIColor *)titleBarButtonSelectedColor;
+ (UIColor *)selectTitleBarColor;
+ (UIColor *)navigationbarColor;
+ (UIColor *)selectCellSColor;
+ (UIColor *)labelTextColor;
+ (UIColor *)teamButtonColor;

+ (UIColor *)infosBackViewColor;
+ (UIColor *)lineColor;

+ (UIColor *)contentTextColor;
+ (UIColor *)borderColor;
+ (UIColor *)refreshControlColor;

+ (UIColor *)buttonDisabledColor;
+ (UIColor *)buttonNormalColor;
+ (UIColor *)buttonHighlightedColor;

+ (UIColor *)installButtonNormalCorlor;

+ (UIColor *)descriptionColor;

+ (UIColor *)textColor;

+ (UIColor *)gameDetailsCellInfoColor;

+ (UIColor *)newSectionButtonSelectedColor;

//黑色
+ (UIColor *)customBlackColor;
//灰色
+ (UIColor *)customGrayColor;
//浅灰色
+ (UIColor *)customLightgreyColor;
//绿色
+ (UIColor *)customGreenColor;
//蓝色
+ (UIColor *)customBlueColor;
//红色
+ (UIColor *)customRedColor;
//橙色
+ (UIColor *)customOrangeColor;
//比较深的浅灰背景色
+ (UIColor *)f2Color;
//比较浅的浅灰背景色
+ (UIColor *)f5Color;

//比较浅的浅灰背景色
+ (UIColor *)f9Color;
+ (UIColor *)ffColor;
+ (UIColor *)Color66;
+ (UIColor *)color99;
+ (UIColor *)colorEF;

+ (UIColor *)customFaceBookColor;

#pragma mark - SDK ?
+ (UIColor *)autoLoginAccountColor;
+ (UIColor *)textColor99;
+ (UIColor *)colorED;
+ (UIColor *)colorF5;
+ (UIColor *)colorD5;
+ (UIColor *)colorEA;
+ (UIColor *)colorDCFFFB;
+ (UIColor *)colorF2;
+ (UIColor *)colorF9;
+(UIColor *)color33;
+(UIColor *)colorFF;
+(UIColor *)colorF0;

/**
 *  十六进制颜色
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;


/**
 *  十六进制颜色:含alpha
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha;

@end
