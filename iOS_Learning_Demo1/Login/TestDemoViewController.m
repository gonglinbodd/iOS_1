//
//  TestDemoViewController.m
//  iOS_Learning_Demo1
//
//  Created by smwl on 2020/12/28.
//

#import "TestDemoViewController.h"
#import "SMUtils.h"
#import <Masonry.h>

//类扩展
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
     区别只在于alloc分配内存的时候使用了zone.
     zone给对象分配内存的时候，把关联的对象分配到一个相邻的内存区域内，以便于调用时消耗很少的代价，提升了程序处理速度；
     
     采用new的方式只能采用默认的init方法完成初始化，
     采用alloc的方式可以用其他定制的初始化方法。
     */
    
    UIButton * loginBtn = [[UIButton alloc] init];
    //loginBtn.titleLabel.text = @"Login";
    
    //设置的0，常规状态显示
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    //将按钮的位置设置在这个位置，-------------问题是按钮呢？？？？为什么不会显示在界面上
    loginBtn.frame = CGRectMake((CurrentWidth - 200) / 2, CurrentHeight - 200, 200, 50);
    loginBtn.backgroundColor = [UIColor blueColor];
    
    //---------点击之后更改颜色？
    //[loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //圆弧
    loginBtn.layer.cornerRadius = 50 / 2;
    [self.view addSubview:loginBtn];
    //目标-动作模式，当某个事件发生 的时候，调用特定对象的特定方法。
    //UIControlEventTouchUpInside=1<<6,手指在在control内部 触发的touch-up事件(经常给按钮添加这个事件)
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)longtimeAction {
    
}

-(void)refreshUI {
    
}

//在日常开发中，当一个类的内部方法过多，有效的使用#pragma mark对类中的方法分类，将对后续的维护，快速定位方法体提供很大的帮助。
#pragma mark - Action
-(void)loginBtnAction:(UIButton *)btn {
    NSLog(@"Begin Login ...");
    
    NSString * userName = @"iOS DEMO";
    NSString * pwd = @"123456";
    
    NSDictionary * paramDict = @{
        @"logindata"  :   userName,
        @"loginpass"  :   pwd,
    };
    
    //发送post请求上传文件。”改“
    //网站失效
    //发给服务器的参数全部放在请求体中，理论上，POST传递的数据没有限制(具体还得看服务器的处理能力)
    [SMAFNHelper POST:@"http://m.api.huxiu.com/portal/1/1?client_ver=6&push_type=iOSRel" parameters:paramDict success:^(id responseObject) {
               
    } failure:^(NSError *error) {
        //
    }];
    
    //---------是这里出了问题吗？ 网站ping不通所以导致失败？不对。
    [SMAFNHelper POST:TestLoginUrl parameters:paramDict body:^(id<AFMultipartFormData> formData) {
        
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        NSLog(@"网站失效");
        
    }];
    
}

@end
