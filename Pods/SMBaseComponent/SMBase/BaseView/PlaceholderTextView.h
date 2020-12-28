//
//  PlaceholderTextView.h
//  x7sy
//
//  Created by zunshanli on 16/4/7.
//  Copyright © 2016年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;

- (void)setLineSpacing:(CGFloat)spacing font:(UIFont *)font color:(UIColor *)color;

-(void)setPlaceHolderTextAligntment:(NSTextAlignment)textAlignment;

@end
