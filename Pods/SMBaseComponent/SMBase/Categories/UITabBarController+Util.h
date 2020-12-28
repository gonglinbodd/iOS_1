//
//  UITabBarController+Util.h
//  SMSDK
//
//  Created by shangminet on 17/3/29.
//  Copyright © 2017年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Util)
- (void)showBadgeOnItemIndex:(int)index Withnum:(NSString *)num;//显示提示小红点标记
- (void)hideBadgeOnItemIndex:(int)index;//隐藏小红点标记
- (void)removeBadgeOnItemIndex:(int)index;//移除小红点标记
@end
