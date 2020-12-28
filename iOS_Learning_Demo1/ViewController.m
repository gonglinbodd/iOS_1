//
//  ViewController.m
//  iOS_Learning_Demo1
//
//  Created by smwl on 2020/12/28.
//

#import "ViewController.h"

#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTestUI];
}

-(void)addTestUI {
    //login Btn
    
    /**
     UIButton * loginBtn = [[UIButton alloc] init];
     UIButton * loginBtn = [UIButton new];
     两行代码的区别是什么？
     */
    UIButton * loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake((CurrentWidth - 200) / 2, 100, 200, 50);
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 50 / 2;
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Action
-(void)loginBtnAction:(UIButton *)btn {
    
}

@end
