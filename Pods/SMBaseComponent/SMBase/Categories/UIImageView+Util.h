//
//  UIImageView+Util.h
//  iosapp
//
//  Created by chenhaoxiang on 11/11/14.
//  Copyright (c) 2014 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Util)

- (void)loadPortrait:(NSURL *)portraitURL;

/**
    size : 国内版图片大小
    colorStr：颜色
    direction：箭头指向方向
    pointx：箭头X轴方向
    contentLabel：内容label。
 isAddCloseBtn : 是否需要添加关闭按钮
 */
- (void)internationalImageWithSize:(CGSize)size colorStr:(NSString *)colorStr pointDirection:(NSString *)direction pointX:(CGFloat)pointx contentLabel:(UILabel *)contentLabel andAddCloseBtn:(BOOL)isAddCloseBtn andCloseAction:(void (^)(void))closeAction;

@end
