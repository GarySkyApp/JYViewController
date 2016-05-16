//
//  JYBaseViewController.m
//  JYBaseVC
//
//  Created by Gary on 16/5/14.
//  Copyright © 2016年 JY. All rights reserved.
//

//先数据 后UI


#import "JYBaseViewController.h"
#import "JYNavigationControllerState.h"

@interface JYBaseViewController ()

@property (nonatomic, strong) JYNavigationControllerState *navigationControllerState;
@end

@implementation JYBaseViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configerUILayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self getPreviousNavigationControllerState];
    });
    [self registerNotification];
    [self setPreviousNavigationControllerState];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //移除 通知
    [self removeNotification];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark - 成员
-(JYNavigationControllerState *)navigationControllerState{
    if (!_navigationControllerState) {
        _navigationControllerState = [[JYNavigationControllerState alloc] init];
    }
    return _navigationControllerState;
}

#pragma mark - Interface 


-(void)configerUILayout{
    //自定义UI布局
}


#pragma mark - 导航条
//获取导航条状态
-(void) getPreviousNavigationControllerState{
    self.navigationControllerState.previousNavBarBarTintColor = self.navigationController.navigationBar.barTintColor;
    self.navigationControllerState.previousNavBarTranslucent = self.navigationController.navigationBar.translucent;
    self.navigationControllerState.previousNavBarTintColor = self.navigationController.navigationBar.tintColor;
    self.navigationControllerState.previousNavBarHidden = self.navigationController.navigationBarHidden;
    self.navigationControllerState.previousNavBarStyle = self.navigationController.navigationBar.barStyle;
    self.navigationControllerState.previousNavigationBarBackgroundImageDefault = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
//    self.navigationControllerState.previousNavigationBarBackgroundImageLandscapePhone = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsLandscapePhone];
    self.navigationControllerState.previousNavigationBarBackgroundImageLandscapePhone = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsCompact];
    self.navigationControllerState.previousNavBarStyle = [UIApplication sharedApplication].statusBarStyle;
}
//设置导航条
-(void) setPreviousNavigationControllerState{
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.tintColor = self.navigationControllerState.previousNavBarTintColor;
    navBar.translucent = self.navigationControllerState.previousNavBarTranslucent;
    navBar.barTintColor = self.navigationControllerState.previousNavBarBarTintColor;
    navBar.barStyle = self.navigationControllerState.previousNavBarStyle;
    [navBar setBackgroundImage:self.navigationControllerState.previousNavigationBarBackgroundImageDefault forBarMetrics:UIBarMetricsDefault];
    //    [navBar setBackgroundImage:self.navigationControllerState.previousNavigationBarBackgroundImageLandscapePhone forBarMetrics:UIBarMetricsLandscapePhone];
    [navBar setBackgroundImage:self.navigationControllerState.previousNavigationBarBackgroundImageLandscapePhone forBarMetrics:UIBarMetricsCompact];
    self.navigationController.navigationBarHidden = self.navigationControllerState.previousNavBarHidden;
    [[UIApplication sharedApplication] setStatusBarStyle:self.navigationControllerState.previousNavBarStyle];
}

#pragma mark - 通知
//注册通知
-(void)registerNotification{
    // 自定义通知注册
}
//移除通知
-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
