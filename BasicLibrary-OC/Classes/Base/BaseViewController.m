//
//  BaseViewController.m
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseViewControllerNavi];
}

- (void)configBaseViewControllerNavi
{
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark -- actions
- (void)pushController:(UIViewController *)controller
{
    if (!controller) {return;}
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popSelfAndPushController:(UIViewController *)viewController
{
    NSMutableArray *viewCtrollers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [viewCtrollers removeObject:self];
    viewController.hidesBottomBarWhenPushed = viewCtrollers.count > 0;
    [viewCtrollers addObject:viewController];
    [self.navigationController setViewControllers:viewCtrollers animated:YES];
}

- (void)popAndPushViewController:(UIViewController *)viewController removeVC:(NSArray<Class> *)removedControllers
{
    NSMutableArray<UIViewController *> *viewCtrollers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    NSMutableArray<UIViewController *> *removes = [NSMutableArray array];
    [viewCtrollers enumerateObjectsUsingBlock:^(UIViewController *ovc, NSUInteger idx, BOOL *stop) {
        for(Class clazz in removedControllers){
            if([ovc isKindOfClass:clazz]){
                [removes addObject:ovc];
                break;
            }
        }
    }];
    [viewCtrollers removeObjectsInArray:removes];
    viewController.hidesBottomBarWhenPushed = viewCtrollers.count > 0;
    [viewCtrollers addObject:viewController];
    [self.navigationController setViewControllers:viewCtrollers animated:YES];
}

#pragma mark -- BaseViewProtocol
- (void)showHUD
{
    
}

- (void)hideHUD
{
    
}

- (void)backWithErrorMsg:(NSString *)errorMsg
{
    [self back];
}

@end
