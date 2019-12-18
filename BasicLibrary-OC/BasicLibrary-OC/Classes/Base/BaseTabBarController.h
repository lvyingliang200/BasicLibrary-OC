//
//  BaseTabBarController.h
//  LottieDemo
//
//  Created by 吕英良 on 2019/11/26.
//  Copyright © 2019 Risense. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController

/// 通过plist文件添加子控制器
/// @param tabBarInfoFileName plist文件名
/// plist字段：identifier、title、image、selectedImage；对应于tTabBar的相关字段
- (void)addChildControllersWithPlistFileName:(NSString *)tabBarInfoFileName;

@end

NS_ASSUME_NONNULL_END
