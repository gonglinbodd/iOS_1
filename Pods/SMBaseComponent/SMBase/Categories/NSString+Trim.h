//
//  NSString+Trim.h
//  SMSDK
//
//  Created by zunshanli on 2016/10/28.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SMTrim)

+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet;
+ (NSString *)trimWhitespace:(NSString *)val;
+ (NSString *)trimNewline:(NSString *)val;
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val;

+ (NSString *)sm_URLEncodedString:(NSString *)str;
+ (NSString *)sm_URLDecodedString:(NSString *)str;

@end
