//
//  BaseViewController.m
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseViewControllerNavi];
}

- (void)configBaseViewControllerNavi
{
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
