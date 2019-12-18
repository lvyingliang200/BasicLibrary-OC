//
//  BaseNavigationController.m
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0 ? YES : NO;
    [super pushViewController:viewController animated:animated];
}

@end
