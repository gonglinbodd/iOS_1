//
//  SMbase64.h
//  x7sy
//
//  Created by shangminet on 16/11/2.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMbase64 : NSObject
+(NSString *)encodeBase64String:(NSString*)input;

+(NSString *)decodeBase64String:(NSString*)input;

+(NSString *)encodeBase64Data:(NSData*)data;

+(NSString *)decodeBase64Data:(NSData*)data;

+(NSData *)decodeBase64:(NSString*)input;

+(NSString *)stringByWebSafeEncodingBytes:(const void *)bytes length:(NSUInteger)length;

+(NSString *)stringByEncodingBytes:(const void *)bytes length:(NSUInteger)length;

+(NSData *)webSafeDecodeString:(NSString* )input;
@end
