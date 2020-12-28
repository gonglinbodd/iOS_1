//
//  UIImage+Extend.h
//  CDHN
//
//  Created by zunshanli on 15/6/13.
//  Copyright (c) 2014年 李遵山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)


#pragma mark  图片加水印
/*
 *  水印方向
 */
typedef enum {
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;


/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;



#pragma mark 一种颜色，一个尺寸返回一个UIImage:不透明

+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark 图片的属性控制
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)normalizedImage;
/**
 图片拉伸，要求imageView的contentmode为ScaleAspectFill

 @param capInsets 需要保护的边缘区域，相对于imageViewSize的比例
 @param size imageView的size
 @return UIImage
 */
- (UIImage *)sm_resizableImageWithCapInsets:(UIEdgeInsets)capInsets imageViewSize:(CGSize)size;

@end
