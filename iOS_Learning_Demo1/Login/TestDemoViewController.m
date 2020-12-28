//
//  TestDemoViewController.m
//  iOS_Learning_Demo1
//
//  Created by smwl on 2020/12/28.
//

#import "TestDemoViewController.h"

@interface TestDemoViewController ()

@end

@implementation TestDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    loginBtn.frame = CGRectMake((CurrentWidth - 200) / 2, CurrentHeight - 200, 200, 50);
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 50 / 2;
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Action
-(void)loginBtnAction:(UIButton *)btn {
    NSLog(@"Begin Login ...");
    
    NSString * userName = @"iOS DEMO";
    NSString * pwd = @"123456";
    
    NSDictionary * paramDict = @{
        @"logindata"  :   userName,
        @"loginpass"  :   pwd,
    };
    
    [SMAFNHelper POST:TestLoginUrl parameters:paramDict success:^(id responseObject) {
               
    } failure:^(NSError *error) {
        //
    }];
}

@end
