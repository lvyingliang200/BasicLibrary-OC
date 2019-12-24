//
//  BaseNavigationController.m
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0;
    [super pushViewController:viewController animated:animated];
}

#pragma mark -- UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = [self.viewControllers count] > 1;
}

#pragma mark -- config
- (void)setup
{
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

@end
