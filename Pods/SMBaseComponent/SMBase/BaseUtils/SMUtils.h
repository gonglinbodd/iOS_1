//
//  SMUtils.h
//  x7sy
//
//  Created by zunshanli on 16/4/1.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMUtils : NSObject
@property (nonatomic, strong) NSMutableDictionary * gameInfoDict;
+ (instancetype)instance;

+ (NSString *)md5HexDigest:(NSString*)input;
+ (NSDictionary *)paramsAddParameterEncode:(NSDictionary *)params;
+ (NSString *)paramsAddParameterEncode1:(NSDictionary *)params;
+ (NSDictionary *)userParameterEncode:(NSDictionary *)params;
+ (NSString *)userParameterEncode1:(NSDictionary *)params;
+ (NSDictionary *)roleTradeParameterEncode:(NSDictionary *)params;
+ (NSString *)roleTradeParameterEncode1:(NSDictionary *)params;
+ (NSDictionary *)paramsPayEncode1:(NSDictionary *)params;
+ (NSString *)paramsNewRandomNumEncode:(NSDictionary *)params andKey:(NSString *)key;
+ (NSDictionary *)paramsNewRandomNumEncode1:(NSDictionary *)params andKey:(NSString *)key;
+ (NSDictionary *)paramsNewEncode:(NSDictionary *)params andKey:(NSString *)key;
+ (NSDictionary *)paramsNewEncode:(NSDictionary *)params;
+ (NSString *)paramsNewEncode1:(NSDictionary *)params andKey:(NSString *)key;
+ (NSString *)paramsNewEncode1:(NSDictionary *)params;
+ (NSDictionary *)paramsEncode:(NSDictionary *)params andKey:(NSString *)key;
+ (NSDictionary *)paramsEncode:(NSDictionary *)params;
+ (NSString *)paramsEncode1:(NSDictionary *)params andKey:(NSString *)key;
+ (NSString *)paramsEncode1:(NSDictionary *)params;
//生成头信息参数
+(NSString *)smHeaderInformationparamsEncode1:(NSDictionary *)params andKey:(NSString *)key;
//生成login_ticket 参数
+ (NSString *)paramMid:(NSString *)mid andPwd:(NSString *)pwd andGuid:(NSString *)guid;
+ (NSString *)uuidStr; //default, for app
+ (NSString *)uuidStrForSDK; // for sdk
+ (NSString *)idfaStr;//default, for app [tips: 在iOS14后调用需要在Info.plist增加idfa权限]
+ (NSString *)idfaStrForSDK; //for sdk [tips: 在iOS14后调用需要在Info.plist增加idfa权限]
+ (NSString *)URLEncodedString:(NSString *)str;
+ (NSString *)URLDecodedString:(NSString *)str;
+ (NSString *)make_encode:(NSDictionary *)params andKey:(NSString *)key;
//最新的异或加密封装的方法
+(NSString *)paramsRandomNumEncodeWithXOR:(NSDictionary *)parame andKey:(NSString *)key;
+(NSDictionary *)paramsRandomNumEncodeWithXOR1:(NSDictionary *)parame andKey:(NSString *)key;
+(NSString *)sha1HexDigest:(NSString *)input;
//异或解密
+(NSString *)XORHexDecode:(NSString *)OriginalStr andKey:(NSString *)key;
//4.21版本添加新的头信息
+(NSDictionary *)smNewheaderInfotmation;


//转换NSDictionary中value=null为""
+ (NSDictionary *)convertDictNullToString:(NSDictionary *)dict;
//获得Label每行的文本字符串数组
+ (NSArray *)getLinesArrayOfStringInLabel:(NSString *)text andBounds:(CGRect)rect andFont:(UIFont *)font;
//计算宽度
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width;
//计算字符串长度，因为有些地方需要自适应宽高
+(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;
//正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
//正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
//正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
//正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
//正则匹配验证码,4-6位的数字
+ (BOOL)checkCodeNumber : (NSString *) number;
//正则匹配URL
+ (BOOL)checkURL : (NSString *) url;
//判断字符串是否是是数字、字母、下划线
+(BOOL)isChineseCharacterAndLettersAndNumbersAndUnderScore:(NSString *)string;
//判断某个时间是否在结束时间和开始时间之间
+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime;
//判断某个时间是否在结束时间之前
+ (BOOL)isOrderedAscendingWithExpireTime:(NSString *)expireTime;
//计算texiview的高度
+ (float) heightForString:(UITextView *)textView andWidth:(float)width;
//字符串去掉前后空格
+(NSString *)replceSpaceWithStr:(NSString *)str;
//设置一串字符串中其中部分的字体颜色和大小
+(NSMutableAttributedString *)setStrWithstr:(NSString *)oldStr andSubstr:(NSString *)subStr andColor:(UIColor *)color andFond:(UIFont *)font;
//判断一个字符串是否为纯数字
+ (BOOL)deptNumInputShouldNumber:(NSString *)str;
//设置用户认证的label,因为都是一样的
+(UILabel *)setUserIdentifyLabelWithtext:(NSString *)text;
//添加渐变颜色
/**
 frameX : 等于1的时候是x轴渐变，等于0的时候x轴颜色不渐变
 frameY ：等于1的时候是y轴渐变，等于0的时候y轴颜色不渐变
 width ： 需要设置渐变view的宽度
 height ： 需要设置渐变view的高度
 */
+ (CAGradientLayer *)setGradualChangeWithX:(CGFloat)frameX andY:(CGFloat)frameY andWidth:(CGFloat)width andHeight:(CGFloat)height;
//渐变颜色的设置（传16进制颜色值）
+ (void)setColorWithGradientLayer:(CAGradientLayer *)gradientLayer andFromeColor:(NSString *)fromColor andTocolor:(NSString *)toColor;
//设置渐变(传颜色过来)
+(void)setColorWithGradientLayer:(CAGradientLayer *)gradientLayer andFromeColors:(UIColor *)fromColor andTocolors:(UIColor *)toColor;
//获取随机参数
+(NSString *)generateTradeNO;
//获取user-agent
+ (NSString *)generateUserAgent;
+(NSString *)convertToJsonData:(NSDictionary *)params;
//字典转json字符串
+(NSString *)convertToJsonData:(NSDictionary *)params andKey:(NSString *)key andTimestr:(NSString *)timeStr andRandom:(NSString *)random andUseragent:(NSString *)useragent;
//获取当前时间戳
+(NSString *)getNowTimeTimestamp;
//时间差的计算
+ (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
//判断密码复杂度是否符合标准（包含数字，大写字母，小写字母，特殊字符两种或两种以上则符合）
+(BOOL)isPassWordComplexWithPwd:(NSString *)pwd;
/**
 特殊字符串解析 4.1 登录会话
 @param seperateStr 用于分割的字符串，类似[]
 @param serverString 服务端返回的错误信息：类型 "str1+seperateStr+str2+seperateStr+str3"
 @return 解析出来的str2
 */
+(NSString *)getDeviceNoMoreEffectiveSubStringFromServerSting:(NSString *)serverString andSeperateStr:(NSString *)seperateStr;
/**
 4.1 根据标题返回自适应的宽度，标题和标题之间，标题和屏幕之间的距离都相等
 @param titleArray 标题文字数组
 @param 当前选中的下标
 @return 宽度数组
 */
+(NSArray *)getSuitableTitleWidthArrayWithTitleArray:(NSArray *)titles andIndex:(NSInteger)index andSelectFont:(UIFont *)selectFont andNotSelectFont:(UIFont *)notSelectFont;
//获取当前顶部控制器
+ (UIViewController*)topViewController;
//判断是不是刘海屏
+(BOOL)isiPhoneXScreen;
//导航栏的高度
+(CGFloat)navigationHeight;
//距离状态栏的高度
+(CGFloat)ToptoStatusHeight;
//是否是gif图片
+(NSString *)contentTypeForImageData:(NSData *)data;
//控件抖动
+(void)shakeAnimationForView:(UIView *)view;
//字符串转换成json
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+(void)shakeAnimationForIcon:(UIView *)view;
-(NSString *)changeByJSWithStr:(NSString *)str;
-(NSString *)changeByJSWithStr_simple:(NSString *)str;
//检查某个日期是否在指定日期之后，是的话返回yes
+ (BOOL)checkProductDate: (NSString *)AddtempDate;
//创建根据中文符号【】显示为特定样式 - 给应用市场调用
+(CGFloat)createNewRichtextWithHeight:(CGFloat)height andValue:(NSString *)valueText andValueType:(NSString *)valueType andView:(UIView *)userIconImageview andSubview:(UIView *)subview;
//给SDK调用
+(CGFloat)createNewRichtextWithHeight:(CGFloat)height andValue:(NSString *)valueText andValueType:(NSString *)valueType andView:(UIView *)userIconImageview andSubview:(UIView *)subview andSuitableSize:(CGFloat)suitableSize;
+(BOOL)array:(NSArray *)array1 isEqualTo:(NSArray *)array2;
//比较两个版本号的大小
+ (NSInteger)compareVersion2:(NSString *)v1 to:(NSString *)v2;
+ (NSString *)getIPAddress:(BOOL)preferIPv4;

@end
