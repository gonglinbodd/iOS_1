//
//  SMUILabel.h
//  x7sy
//
//  Created by smwl on 2019/1/9.
//  Copyright © 2019 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^IXAttributeTapLabelTapBlock)(NSString * string);

@interface IXAttributeModel : NSObject
@property (nonatomic, copy) NSString    * string;   //高亮字符串
@property (nonatomic, assign) NSRange   range;      //字符串位置
@property (nonatomic, strong) UIImage   * alertImg; //高粱字符串后跟提示图片
@property (nonatomic, strong) NSDictionary  * attributeDic; //富文本颜色字体等配置
@end

@interface SMUILabel : UILabel
@property (nonatomic, assign) UIEdgeInsets textInsets; // 控制字体与控件边界的间隙


@property (nonatomic, copy) IXAttributeTapLabelTapBlock tapBlock;   //目标点击回调

-(void)showWithRect1:(CGRect)rect1 andRect2:(CGRect)rect2;

/**
 设置文本
 
 @param text 文本内容
 @param attr 富文本样式 （样式中务必设置字体，若使用系统默认字体可能导致点击无响应或者响应混乱）
 @param stringArray 需要处理点击的文本
 */
- (void)setText:(NSString *)text attributes:(NSDictionary *)attr tapStringArray:(NSArray <IXAttributeModel *>*)stringArray;

@end

NS_ASSUME_NONNULL_END
