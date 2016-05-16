//
//  JYNavigationControllerState.h
//  JYBaseVC
//
//  Created by Gary on 16/5/14.
//  Copyright © 2016年 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYNavigationControllerState : NSObject

@property (nonatomic, strong) UIColor *previousNavBarBarTintColor;
@property (nonatomic, strong) UIColor *previousNavBarTintColor;
@property (nonatomic, assign) UIBarStyle previousNavBarStyle;
@property (nonatomic, assign) UIImage *previousNavigationBarBackgroundImageDefault;
@property (nonatomic, assign) UIImage *previousNavigationBarBackgroundImageLandscapePhone;
@property (nonatomic, assign) BOOL previousNavBarHidden;
@property (nonatomic, assign) BOOL previousNavBarTranslucent;
@property (nonatomic, assign) UIStatusBarStyle previousStatusBarStyle;

@end
