//
//  HomeViewController.m
//  iOS_Learning_Demo1
//
//  Created by shangminet on 2023/6/19.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self backGround];
    [self UserView];
    [self activeField];
    [self settingsButton];
    [self messageButton];
}

-(void)backGround{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CurrentWidth, 260)];
    bgView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bgView];
}
-(void)settingsButton{
    UIButton *settingBtn = [[UIButton alloc ] initWithFrame:CGRectMake(270, 70, 30, 30)];
    UIImage *settingImage = [UIImage imageNamed:@"bianji"];
    [settingBtn setImage:settingImage forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingBtn];
    
}

-(void)messageButton{
    UIButton *messageBtn = [[UIButton alloc ] initWithFrame:CGRectMake(310, 68, 35, 35)];

    UIImage *messageImage = [UIImage imageNamed:@"xiaoxi"];
    [messageBtn setImage:messageImage forState:UIControlStateNormal];
    [self.view addSubview:messageBtn];
}

-(void)UserView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120, 80, 80)];
    imageView.image = [UIImage imageNamed:@"avatar09"];
    imageView.layer.zPosition = 1;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    imageView.clipsToBounds = YES;
    imageView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:imageView];
    
    // 创建文本框并设置内容
    UILabel *nickName = [[UILabel alloc] initWithFrame:CGRectMake(110, 130, 200, 25)];
    nickName.text = @"卑鄙的飞鱼岛主";
    nickName.textColor = [UIColor whiteColor];
    nickName.font = [UIFont boldSystemFontOfSize:25];
    
    UILabel *userAccount = [[UILabel alloc] initWithFrame:CGRectMake(110, 160, 200, 25)];
    //读数据，将保存的用户账号取出来
    NSString *filePath = @"/Users/shangminet/Library/myUserData/userLoginData.archive";
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    UserLoginModel *loginData = [unarchiver decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    
    NSString *un = loginData.userName;
    [unarchiver finishDecoding];
    
    NSString *text=@"账号：";
    NSString *un2 = [NSString stringWithFormat:@"%@ %@", text, un];
    userAccount.text =un2;
    userAccount.textColor = [UIColor whiteColor];
    userAccount.font = [UIFont boldSystemFontOfSize:12];
    
    [self.view addSubview:nickName];
    [self.view addSubview:userAccount];
}

-(void)activeField{
    UILabel *activeFieldBackDrop =[[UILabel alloc] initWithFrame:CGRectMake(20, 210, 353, 100)];
    activeFieldBackDrop.backgroundColor = [UIColor whiteColor];
    activeFieldBackDrop.layer.zPosition = 1;
    activeFieldBackDrop.layer.cornerRadius=7;
    activeFieldBackDrop.layer.masksToBounds = YES;
    [self.view addSubview:activeFieldBackDrop];
    
    UILabel *favorableText =[[UILabel alloc]initWithFrame:CGRectMake(40, 230, 145, 30)];
    favorableText.text = @"代金劵";
    favorableText.font = [UIFont systemFontOfSize:25];
    favorableText.layer.zPosition=2;
    [self.view addSubview:favorableText];
    
    UILabel *favorableTipsText =[[UILabel alloc]initWithFrame:CGRectMake(40, 260, 145, 15)];
    favorableTipsText.text = @"领取的这里可以看";
    favorableTipsText.font = [UIFont systemFontOfSize:12];
    favorableTipsText.textColor=[UIColor grayColor];
    favorableTipsText.layer.zPosition=2;
    [self.view addSubview:favorableTipsText];
    
    UIButton *favorableButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 240, 20, 20)];
    favorableButton.layer.zPosition=2;
    [favorableButton setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];
    [self.view addSubview:favorableButton];
 
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CurrentWidth/2, 220, 1, 55)];
    lineView.backgroundColor = [UIColor grayColor];
    lineView.layer.zPosition=2;
    [self.view addSubview:lineView];
    
    // 创建富文本字符串
    NSString *text = @"余额：7426.60";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:NSMakeRange(0, 3)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(3, 4)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25.0] range:NSMakeRange(3, 4)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(7, 3)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16.0] range:NSMakeRange(7, 3)];

    // 创建 UILabel 并设置富文本
    UILabel *balanceText =[[UILabel alloc]initWithFrame:CGRectMake(CurrentWidth/2+20, 230, 145, 30)];
    balanceText.attributedText = attributedString;
    [self.view addSubview: balanceText];
    balanceText.layer.zPosition=2;
    [self.view addSubview:balanceText];
    
    UILabel *balanceTipsText =[[UILabel alloc]initWithFrame:CGRectMake(CurrentWidth/2+20, 260, 145, 15)];
    balanceTipsText.text = @"赠送：6.40";
    balanceTipsText.font = [UIFont systemFontOfSize:14];
    balanceTipsText.textColor=[UIColor grayColor];
    balanceTipsText.layer.zPosition=2;
    [self.view addSubview:balanceTipsText];
    
    UIButton *balanceButton = [[UIButton alloc] initWithFrame:CGRectMake(CurrentWidth/2+150, 240, 20, 20)];
    [balanceButton setImage:[UIImage imageNamed:@"kuohao"] forState:UIControlStateNormal];
    balanceButton.layer.zPosition=2;
    [self.view addSubview:balanceButton];
}

#pragma mark - Navigation
-(void)settingsButtonPressed:(UIButton *)settingbtn{
    UserInfViewController *infVc=[UserInfViewController new];
    infVc.modalPresentationStyle=UIModalPresentationFullScreen;
    [self presentViewController:infVc animated:YES completion:^{
        //
    }];
}


@end
