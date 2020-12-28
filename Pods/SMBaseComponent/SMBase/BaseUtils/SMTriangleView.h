//
//  SMTriangleView.h
//  SMBase
//
//  Created by smwl on 2020/8/15.
//  Copyright © 2020 smwl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMTriangleView : UIView

- (instancetype)initStartPoint:(CGPoint)startPoint
                   middlePoint:(CGPoint)middlePoint
                      endPoint:(CGPoint)endPoint
                         color:(UIColor*)color
                   strokeColor:(UIColor *)strokeColor;

@end

NS_ASSUME_NONNULL_END
