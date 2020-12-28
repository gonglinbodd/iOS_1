//
//  SMMBprogressHUDHelper.h
//  x7sy
//
//  Created by smwl on 2020/5/11.
//  Copyright © 2020 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMMBprogressHUDHelper : NSObject

+ (MBProgressHUD *)createHUD;

+ (MBProgressHUD *)createHUD1;

+ (MBProgressHUD *)createHUDWithView:(UIViewController *)viewController;

+ (MBProgressHUD *)createHUDWithView1:(UIView *)view;
+ (void)setHUDText:(NSString *)text andHide:(double)delay andhud:(MBProgressHUD *)hud;
+ (void)setHUDTextAllowEdit:(NSString *)text andHide:(double)delay andhud:(MBProgressHUD *)hud;

@end

NS_ASSUME_NONNULL_END
