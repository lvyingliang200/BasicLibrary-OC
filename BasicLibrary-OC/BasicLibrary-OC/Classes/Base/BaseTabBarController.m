//
//  BaseTabBarController.m
//  LottieDemo
//
//  Created by 吕英良 on 2019/11/26.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/** 添加子控制器 */
- (void)addChildControllersWithPlistFileName:(NSString *)tabBarInfoFileName
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:tabBarInfoFileName ofType:nil];
    NSArray * controllerInfos = [NSArray arrayWithContentsOfFile:filePath];
    NSInteger controllerCount = controllerInfos.count;
    for (NSInteger i = 0; i < controllerCount; i++) {
        NSDictionary * info = controllerInfos[i];
        NSString * identify = info[@"identifier"];
        NSString * title = info[@"title"];
        NSString * image = info[@"image"];
        NSString * selectedImage = info[@"selectedImage"];
        [self initWithIdentify:identify Title:title ImageName:image SelectedImage:selectedImage];
    }
}

/**
 初始化TabBarItem的相关信息
 @param identify 控制器类名
 @param title tabbar的title
 @param image 普通状态下的图片
 @param selectedImage 选中状态下的图片
 */
- (void)initWithIdentify:(NSString *)identify Title:(NSString *)title ImageName:(NSString *)image SelectedImage:(NSString *)selectedImage
{
    UIViewController *viewController = [[NSClassFromString(identify) alloc] init];
    UITabBarItem *tabBarItem =[[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[UIImage imageNamed:selectedImage]];
    viewController.tabBarItem = tabBarItem;
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
}


@end
