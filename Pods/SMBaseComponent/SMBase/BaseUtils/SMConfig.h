//
//  SMConfig.h
//  x7sy 配置文件
//
//  Created by zunshanli on 16/4/1.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMConfig : NSObject

/**
 设置是否是企业签，每次启动应用的时候需要配置，内部从Info.plist, SMIsEnterpriseSign去读取
 */
+(void)setIsEnterpriseSign;

/**
 是否是企业签

 @return BOOL
 */
+(BOOL)getIsEnterpriseSign;


+(void)setUserUDID:(NSString *)udid;
+(NSString *)getUserUDID;

+(void)setHasChangeTagOrder:(BOOL)hasChanged;

+(BOOL)getHasChangeTagOrder;

/**
 为1的时候是大陆
 */
+(BOOL)isNormalXQMarket;

+ (void)setChannelId:(NSString *)channelId;

+ (NSString *)channelId;
@end
