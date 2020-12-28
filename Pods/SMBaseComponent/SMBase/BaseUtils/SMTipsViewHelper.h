//
//  SMTipsViewHelper.h
//  x7sy
//
//  Created by smwl on 2020/8/7.
//  Copyright © 2020 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SMTipsViewTriangleDirection) {
    SMTipsViewTriangleDirectionTop,
    SMTipsViewTriangleDirectionBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface SMTipsViewHelper : NSObject

///  创建
/// @param content 交互提示内容
/// @param closeAction 点击关闭以后的回调，默认不需要处理什么
/// @param toLeft 小三角形距离边距的距离，大于0表示距离左边，小于0表示距离右边。+10表示距离左边10，-10表示距离右边10
/// @param localStoreString 本地只显示一次的存储字段，点击关闭按钮后会默认不显示
/// @param superViewToAdd 添加到的父视图
/// @param pointToPoint 三角形指向的点相对于父视图的位置
+(UIView *)makeNormalUITipsWithContent:(NSString *)content closeBtnAction:(void(^)(void))closeAction toLeft:(float)toLeft direction:(SMTipsViewTriangleDirection)direction localStoreTips:(NSString *)localStoreString superViewToAdd:(UIView *)superViewToAdd pointToPoint:(CGPoint)pointToPoint;

//需求隐藏的时候调用
+(void)hidetipsView:(UIView *)tipsView withLocalStoreStr:(NSString *)localStoreStr;

//更加存储的字段判断还能否显示
+(BOOL)judgeCanShowWithLocalStoreStr:(NSString *)localStoreStr;

//绘制小三角形
+(void)makeTriangleWithView:(UIView *)view direction:(SMTipsViewTriangleDirection)direction andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
