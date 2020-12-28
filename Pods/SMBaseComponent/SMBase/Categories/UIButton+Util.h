//
//  UIButton+Util.h
//  x7sy
//
//  Created by zunshanli on 16/7/23.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)

- (void)addEventHandler:(void(^)(UIButton *sender))handler forControlEvents:(UIControlEvents)controlEvents;

/**
 链式编程之设置titleColor
 */
- (UIButton *(^)(UIColor *color))cp_titleColor;

@end
