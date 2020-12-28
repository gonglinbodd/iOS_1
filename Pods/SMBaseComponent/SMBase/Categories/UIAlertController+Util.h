//
//  UIAlertController+Util.h
//  x7sy
//
//  Created by zunshanli on 2017/7/25.
//  Copyright © 2017年 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SMNewAlertViewControllerType) {
    SMNewAlertViewControllerTypeTips,       //V4.0.0SDK的提示类型
    SMNewAlertViewControllerTypeWarning     //V4.0.0SDK的警告类型
};

@interface UIAlertController (Util)

- (BOOL)willDealloc;

+ (UIAlertController *)sm_alertWithTitle:(NSString *)title message:(NSString *)message;
+ (UIAlertController *)sm_alertWithTitle:(NSString *)title message:(NSString *)message textAlignment:(NSTextAlignment)textAlignment;


/**
 富文本弹窗

 @param title title
 @param message message
 @param leftBtn left Btn title
 @param rightBtn right Btn title
 @param leftAction block
 @param rightAction block
 @param alertType alertType
 @return UIAlertController instance
 */
+(UIAlertController *)sm_alertWithTitle:(NSString *)title message:(NSString *)message leftBtn:(NSString *)leftBtn rightBtn:(NSString *)rightBtn leftAction:(void (^)(id))leftAction rightAction:(void (^)(id))rightAction andAlertType:(SMNewAlertViewControllerType)alertType;
@end
