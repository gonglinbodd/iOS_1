//
//  MainRootViewController.h
//  x7sy
//
//  Created by smwl on 2018/4/29.
//  Copyright © 2018年 shangminet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainRootViewController : UIViewController
-(void)setTitleBarWitntitle:(NSString *)title andright:(NSString *)rightStr;

-(void)setTitleBarWitntitle:(NSString *)title andrightImg:(NSString *)rightImgStr;

-(void)SMSetBgView;

-(void)settitleWithtitle:(NSString *)title;

-(void)SMSetBackButton;

@property (nonatomic, strong) UILabel * navTitle;
@property (nonatomic, strong) UIView *navbgView;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *backbut;//返回按钮
@end
