//
//  JYBaseViewController.h
//  JYBaseVC
//
//  Created by Gary on 16/5/14.
//  Copyright © 2016年 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYBaseViewController : UIViewController

@property (nonatomic, strong) id dataSource;

//数据 设置/获取
-(void) setjyDataSource; // 不在基类中实现，用于提醒子类是否实现了此方法
-(id) getjyDataSource; // 不在基类中实现，用于提醒子类是否实现了此方法
//布局
-(void) configerUILayout;
//通知
-(void) registerNotification;
-(void) removeNotification;

@end
