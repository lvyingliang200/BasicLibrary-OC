//
//  BaseViewController.h
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
<BaseViewProtocol>

///跳转控制器，相当于：[self.navigationController pushViewController:controller animated:YES];
- (void)pushController:(UIViewController *)controller;

/// 跳转控制器并移除当前控制器
/// @param viewController 跳转的控制器
- (void)popSelfAndPushController:(UIViewController *)viewController;

/// 跳转到指定控制器并删除指定控制器
/// @param viewController 跳转到的控制器
/// @param removedControllers 指定删除的控制器名字的数组
- (void)popAndPushViewController:(UIViewController *)viewController removeVC:(NSArray<Class> *)removedControllers;

/// 返回，相当于：[self.navigationController popViewControllerAnimated:YES];
- (void)back;

@end

NS_ASSUME_NONNULL_END
