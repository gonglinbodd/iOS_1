//
//  NSArray+Extend.h
//  Wifi
//
//  Created by zunshanli on 15/6/13.
//  Copyright (c) 2014年 李遵山. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extend)

/**
 *  数组转字符串
 */
-(NSString *)string;


/**
 *  数组比较
 */
-(BOOL)compareIgnoreObjectOrderWithArray:(NSArray *)array;

/**
 *  数组计算交集
 */
-(NSArray *)arrayForIntersectionWithOtherArray:(NSArray *)otherArray;

/**
 *  数据计算差集
 */
-(NSArray *)arrayForMinusWithOtherArray:(NSArray *)otherArray;

- (id)objectAtIndexCheck:(NSUInteger)index;
@end
