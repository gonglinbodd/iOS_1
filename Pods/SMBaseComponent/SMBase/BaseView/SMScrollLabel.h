//
//  SMScrollLabel.h
//  x7sy
//
//  Created by pzw on 2020/9/27.
//  Copyright © 2020 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SMScrollLabelState) {
    SMScrollLabelStateStatic = 0,   //静止
    SMScrollLabelStateScrolling,    //滚动中
    SMScrollLabelStatePause
};

typedef NS_ENUM(NSInteger, SMScrollLabelDirection) {
    SMScrollLabelDirectionLeftToRight = 0,
    SMScrollLabelDirectionTopToBottom
};

@interface SMScrollLabel : UIScrollView
/// 每帧数移动多少像素
@property(nonatomic,assign) CGFloat scrollSpeed;
/// 滚动到结束时,暂停多长时间
@property(nonatomic) NSTimeInterval pauseInterval;

//是否自动滚动，默认YES
@property(nonatomic, assign) BOOL isAutoScroll;

//当前的状态
@property(nonatomic, assign, readonly) SMScrollLabelState state;

//滚动的方向，默认从左往右
@property(nonatomic, assign) SMScrollLabelDirection direction;

@property(nonatomic, strong) NSString *text;

@property(nonatomic, strong) NSAttributedString *attributedText;

@property(nonatomic, strong) UIFont *font;

@property(nonatomic, strong) UIColor *textColor;

- (void)startScroll;

- (void)pauseScroll;

- (void)stopScroll;

@end

NS_ASSUME_NONNULL_END
