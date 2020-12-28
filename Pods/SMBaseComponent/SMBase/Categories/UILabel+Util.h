//
//  UILabel+Util.h
//  x7sy
//
//  Created by zunshanli on 16/4/19.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Util)

//初始化的size，size中高度或者宽度为0
-(CGRect)boundingRectWithInitSize:(CGSize)size;

#pragma mark - 设置行间距
- (void)setLineSpacing:(CGFloat)spacing;
- (void)setLineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing;

- (NSMutableAttributedString *)smSetAttributeStringWithText:(NSString *)text andDistance:(NSInteger)distance;

#pragma mark - 获取行间距
- (CGSize)getSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing;
- (CGSize)getSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing;

@end
