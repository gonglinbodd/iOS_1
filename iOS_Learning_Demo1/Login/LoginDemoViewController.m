//
//  TestDemoViewController.m
//  iOS_Learning_Demo1
//
//  Created by smwl on 2020/12/28.
//

#import "LoginDemoViewController.h"
#import "SMUtils.h"
#import <Masonry.h>


//类扩展
@interface LoginDemoViewController ()
@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@end


@implementation LoginDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self logoLabel];
    [self returnBtr];
    [self loginUesr];
    [self hideOrNotBtn];
    [self registerBtn];
    [self verificationBtn];
    [self retrievePasswordBtn];
    [self accountAppealBtn];

}

-(void)returnBtr{
    UIButton *returnBtn = [[UIButton alloc]init];
    returnBtn.frame = CGRectMake(20, 70, 30, 30);
    //returnBtn.backgroundColor=[UIColor whiteColor];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    
    [returnBtn addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
}

-(void)registerBtn{
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"账户注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0] forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    registerButton.frame = CGRectMake(CurrentWidth-120,70, 90, 30);
    [self.view addSubview:registerButton];
}

- (void)logoLabel{
    UILabel *Logo = [[UILabel alloc] initWithFrame:CGRectMake(30, 130, CurrentWidth-50,100)];
    Logo.text = @"欢迎登录小7手游";
    Logo.font = [UIFont boldSystemFontOfSize:30];
    Logo.textColor = [UIColor blackColor];
    Logo.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:Logo];
}

-(void)loginUesr{
    UITextField *UName = [[UITextField alloc] initWithFrame:CGRectMake(40, 230, 313, 50)];
    UName.borderStyle = UITextBorderStyleNone;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, UName.frame.size.height-1, UName.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor]; // 下划线的颜色
    [UName addSubview:lineView];
    UName.placeholder = @"输入用户名";
    UName.font = [UIFont systemFontOfSize:14];
    UName.textColor = [UIColor blackColor];
    UName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:UName];
    
    //键盘输入.没有实现，还是我关了键盘显示----------------------------------------------
    //[UName addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
    
    UITextField *UPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 300, 313, 50)];
    UPassword.borderStyle = UITextBorderStyleNone;
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, UPassword.frame.size.height-1, UPassword.frame.size.width, 1)];
    lineView1.backgroundColor = [UIColor grayColor];
    [UPassword addSubview:lineView1];
    UPassword.placeholder = @"输入用户密码";
    UPassword.secureTextEntry = YES;
    UPassword.font = [UIFont systemFontOfSize:14];
    UPassword.textColor = [UIColor blackColor];
    UPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:UPassword];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 390, 313, 50)];
    loginBtn.backgroundColor = [UIColor colorWithRed:0.1 green:1 blue:0 alpha:1.0];
    loginBtn.layer.cornerRadius = 25;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [loginBtn addTarget:self action:@selector(loginButtonPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    self.userNameTextField=UName;
    self.passwordTextField=UPassword;
    [self.view addSubview:loginBtn];
}

-(void)hideOrNotBtn{
    // 创建单选按钮
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(305, 318, 15, 15);
    [selectBtn setImage:[UIImage imageNamed:@"yanjing-2"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"yanjing"] forState:UIControlStateSelected];
    [selectBtn addTarget:self action:@selector(selectButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    self.selectButton = selectBtn;
}

-(void)verificationBtn{
    UIButton *verificationButton= [UIButton buttonWithType:UIButtonTypeCustom];
    [verificationButton setTitle:@"验证码登录" forState:UIControlStateNormal];
    [verificationButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    verificationButton.frame = CGRectMake(25,455,100,25);
    verificationButton.titleLabel.font= [UIFont systemFontOfSize:16];
    [self.view addSubview:verificationButton];
    
}
-(void)retrievePasswordBtn{
    UIButton *retrievePasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    retrievePasswordButton.frame = CGRectMake(130, 455, 125, 25);
    [retrievePasswordButton setTitle:@"找回登录密码" forState:UIControlStateNormal];
    [retrievePasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    retrievePasswordButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:retrievePasswordButton];
}

-(void)accountAppealBtn{
    UIButton *accountAppealButton = [UIButton buttonWithType:UIButtonTypeCustom];
    accountAppealButton.frame = CGRectMake(265, 455, 80, 25);
    [accountAppealButton setTitle:@"账号申诉" forState:UIControlStateNormal];
    [accountAppealButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    accountAppealButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:accountAppealButton];
}

//在日常开发中，当一个类的内部方法过多，有效的使用#pragma mark对类中的方法分类，将对后续的维护，快速定位方法体提供很大的帮助。
#pragma mark - Action

//键盘输入的响应
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 设置单选按钮类型为 Custom。自定义图像和标题，及其属性-------------------------------
    self.selectButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.selectButton.adjustsImageWhenHighlighted = NO;
}

//密码内容显示
- (void)selectButtonTapped:(UIButton *)sender{
    if (sender.isSelected) {
        self.passwordTextField.secureTextEntry = YES;
    } else {
        self.passwordTextField.secureTextEntry = NO;
    }
    sender.selected = !sender.selected;
}

//---------------------------
//密码验证
- (IBAction)loginButtonPressed:(id)sender {
    // 获取用户名和密码文本框中的内容
    NSString *username = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    // 检查用户名和密码是否正确
    if ([self checkUserCredentialsWithUsername:username password:password]) {
        HomeViewController *homeVc = [HomeViewController new];
        homeVc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:homeVc animated:YES completion:^{
            //
        }];
    } else {
        // 如果不匹配，提示用户登录失败
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户名或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
//        在这里可以对获取到的用户名和密码执行相关操作，例如验证、传递给服务器等
//      保存数据
//    UserLoginModel *loginData = [[UserLoginModel alloc] init];
//    NSString *username = self.signInUserNameTextField.text;
//    NSString *password = self.signInPasswordTextField.text;
//
//    // 将登录数据写入文件保存起来
//    NSString *filePath = [self getFilePathForUserLoginData];
//    BOOL success = [NSKeyedArchiver archiveRootObject:loginData toFile:filePath];
//    if (success) {
//        NSLog(@"登录数据已成功保存到文件：%@", filePath);
//    } else {
//        NSLog(@"无法保存登录数据到文件：%@", filePath);
//    }
}

-(NSString *)getFilePathForUserLoginData {
   // 定义保存文件的名称和路径，先写死，后面再改。方便找文件
   NSString *fileName = @"userLoginData.archive";
   NSString *filePath = [@"/Users/shangminet/Library/myUserData/" stringByAppendingPathComponent:fileName];
   return filePath;
}

- (BOOL)checkUserCredentialsWithUsername:(NSString *)username password:(NSString *)password {
    
    NSString *filePath = [self getFilePathForUserLoginData];
    // 从归档文件中读取数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];

    UserLoginModel *loginData = [unarchiver decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    NSString *un = loginData.userName;
    NSString *upw = loginData.userPassword;
    
    [unarchiver finishDecoding];

    // 检查用户名和密码是否匹配
    if ([un isEqualToString:username] && [upw isEqualToString:password]) {
        return YES;
    } else {
        return NO;
    }
}

//返回按钮，点击应该实现页面的跳转，回到上一页面
-(void)clickReturn:(UIButton *)btn{
    
    btn.backgroundColor=[UIColor grayColor];
    btn.layer.cornerRadius =10;
    
}
@end
