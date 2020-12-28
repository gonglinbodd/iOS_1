//
//  LastCell.h
//  SMSDKDevApp
//
//  Created by zunshanli on 16/2/17.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LastCellStatus)
{
    LastCellStatusNotVisible,
    LastCellStatusMore,
    LastCellStatusLoading,
    LastCellStatusError,
    LastCellStatusFinished,
    LastCellStatusEmpty,
};

@interface LastCell : UIView

@property (nonatomic, assign) LastCellStatus status;
@property (readonly, nonatomic, assign) BOOL shouldResponseToTouch;
@property (nonatomic, copy) NSString *emptyMessage;
@property (nonatomic, strong) NSString  * lastCellType;//这是用来判断是否是交易记录的，因为交易记录最后显示的内容和颜色不一样，所以要做区分，2代表是交易记录
@property (nonatomic, strong) UILabel *textLabel;
@end
