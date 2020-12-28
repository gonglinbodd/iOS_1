//
//  SMUIButton.h
//  UISMSDKDevApp
//
//  Created by zunshanli on 16/1/21.
//  Copyright © 2016年 Shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMUIButton : UIButton

- (instancetype)initWithImageRect:(CGRect)imageRect andTitleRect:(CGRect)titleRect;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;
- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (void)setImageRect:(CGRect)imageRect andTitleRect:(CGRect)titleRect;

/**
 设置button的扩大响应范围，各边扩大相同

 @param size size
 */
- (void)setEnlargeEdge:(CGFloat) size;

/**
 设置button的各边扩大响应范围

 @param top top size
 @param right right size
 @param bottom bottom size
 @param left left size
 */
- (void) setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
