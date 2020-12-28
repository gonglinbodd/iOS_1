//
//  UIButton+EnlargeTouchArea.h
//  x7sy
//
//  Created by smwl on 2018/11/21.
//  Copyright © 2018年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EnlargeTouchArea)
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setEnlargeEdge:(CGFloat) size;
@end

NS_ASSUME_NONNULL_END
