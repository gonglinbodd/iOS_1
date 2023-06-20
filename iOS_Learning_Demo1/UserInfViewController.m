//
//  UserInfViewController.m
//  iOS_Learning_Demo1
//
//  Created by shangminet on 2023/6/19.
//

#import "UserInfViewController.h"

@interface UserInfViewController ()

@end

@implementation UserInfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self returnBtnInf];
    [self InfTips];
    [self accountUser];
    [self passwordUser];
    [self pageUser];
    [self avatarUser];
    [self informationUserName];
    [self exitButton];
}

-(void)returnBtnInf{
    UIButton *returnBtn = [[UIButton alloc]init];
    returnBtn.frame = CGRectMake(20, 70, 30, 30);
    //returnBtn.backgroundColor=[UIColor whiteColor];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    
    [returnBtn addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
}
-(void)InfTips{
    UILabel *infUser = [[UILabel alloc]initWithFrame:CGRectMake(CurrentWidth/3, 70, 150, 50)];
    infUser.text=@"个人信息";
    infUser.font=[UIFont systemFontOfSize:25];
    infUser.textColor=[UIColor blackColor];
    infUser.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:infUser];
}

-(void)accountUser{
    UILabel *accountUser = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, 343, 60)];
    [accountUser setText:@"账号"];
    [accountUser setTextAlignment:NSTextAlignmentLeft]; // 设置文字左对齐
    accountUser.font = [UIFont systemFontOfSize:16];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(accountUser.bounds) - 1.0f, CGRectGetWidth(accountUser.bounds), 0.5f);
    bottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [accountUser.layer addSublayer:bottomBorder];
    [self.view addSubview:accountUser];
    
    UILabel *actUserTips=[[UILabel alloc] initWithFrame:CGRectMake(20, 130, 343, 60)];
    [actUserTips setText:@"111"];
    [actUserTips setTextAlignment:NSTextAlignmentRight];
    actUserTips.font = [UIFont systemFontOfSize:16];
    
    [self.view addSubview:actUserTips];
    
}

-(void)passwordUser{
    UILabel *pwUser = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 343, 60)];
    [pwUser setText:@"密码管理"];
    [pwUser setTextAlignment:NSTextAlignmentLeft];
    pwUser.font = [UIFont systemFontOfSize:16];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(pwUser.bounds) - 1.0f, CGRectGetWidth(pwUser.bounds), 0.5f);
    bottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [pwUser.layer addSublayer:bottomBorder];
    [self.view addSubview:pwUser];
    
    UILabel *editPw=[[UILabel alloc] initWithFrame:CGRectMake(20, 190, 343, 60)];
    [editPw setText:@"修改"];
    [editPw setTextAlignment:NSTextAlignmentRight];
    editPw.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:editPw];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(363, 212, 15, 15)];
    [button setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];

    [self.view addSubview:button];
}

-(void)pageUser{
    UILabel *pgUser = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 343, 60)];
    [pgUser setText:@"封面"];
    [pgUser setTextAlignment:NSTextAlignmentLeft];
    pgUser.font = [UIFont systemFontOfSize:16];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(pgUser.bounds) - 1.0f, CGRectGetWidth(pgUser.bounds), 0.5f);
    bottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [pgUser.layer addSublayer:bottomBorder];
    [self.view addSubview:pgUser];
    
    UILabel *editPw=[[UILabel alloc] initWithFrame:CGRectMake(20, 250, 343, 60)];
    [editPw setText:@"修改"];
    [editPw setTextAlignment:NSTextAlignmentRight];
    editPw.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:editPw];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(363, 272, 15, 15)];
    [button setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];

    [self.view addSubview:button];
}

-(void)avatarUser{
    UILabel *atUser = [[UILabel alloc] initWithFrame:CGRectMake(20, 310, 343, 60)];
    [atUser setText:@"头像"];
    [atUser setTextAlignment:NSTextAlignmentLeft];
    atUser.font = [UIFont systemFontOfSize:16];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(atUser.bounds) - 1.0f, CGRectGetWidth(atUser.bounds), 0.5f);
    bottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [atUser.layer addSublayer:bottomBorder];
    [self.view addSubview:atUser];
    
    UIImageView *atImageView = [[UIImageView alloc] initWithFrame:CGRectMake(310, 315, 50, 50)];
    atImageView.image = [UIImage imageNamed:@"avatar09"];
    CALayer *layer = atImageView.layer;
    [layer setBorderColor: [[UIColor blackColor] CGColor]];
    [layer setBorderWidth: 2.0];
    [layer setCornerRadius: (atImageView.frame.size.width / 2)];
    [layer setMasksToBounds:YES];
    [self.view addSubview:atImageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(363, 332, 15, 15)];
    [button setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];

    [self.view addSubview:button];
}
-(void)informationUserName{
    UILabel *infUName = [[UILabel alloc] initWithFrame:CGRectMake(20, 370, 343, 60)];
    [infUName setText:@"昵称"];
    [infUName setTextAlignment:NSTextAlignmentLeft];
    infUName.font = [UIFont systemFontOfSize:16];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, CGRectGetHeight(infUName.bounds) - 1.0f, CGRectGetWidth(infUName.bounds), 0.5f);
    bottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [infUName.layer addSublayer:bottomBorder];
    [self.view addSubview:infUName];
    
    UILabel *infUserName=[[UILabel alloc] initWithFrame:CGRectMake(20, 370, 343, 60)];
    [infUserName setText:@"卑鄙的飞鱼岛主"];
    [infUserName setTextAlignment:NSTextAlignmentRight];
    infUserName.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:infUserName];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(363, 392, 15, 15)];
    [button setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];

    [self.view addSubview:button];
}

-(void)exitButton{
    UIButton *exitBtn=[[UIButton alloc]initWithFrame:CGRectMake(CurrentWidth/5, CurrentHeight-120, 250, 50)];
    [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    exitBtn.backgroundColor=[UIColor greenColor];
    exitBtn.layer.cornerRadius=25;
    [exitBtn setTintColor:[UIColor whiteColor]];
    exitBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:exitBtn];
    
}
#pragma mark - Navigation
-(void)clickReturn:(id)sender{
    //返回上一页面
}

@end
