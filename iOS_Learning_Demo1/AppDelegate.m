//
//  AppDelegate.m
//  iOS_Learning_Demo1
//
//  Created by smwl on 2020/12/28.
//

#import "AppDelegate.h"
#import "LoginDemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initWindow];
    
    return YES;
}

-(void)initWindow {
    
    LoginDemoViewController * vc = [[LoginDemoViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    
}


- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] init];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    
    return _window;
}

@end
