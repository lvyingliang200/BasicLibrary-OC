//
//  Constant.h
//  LLCommonCode
//
//  Created by 吕英良 on 2019/12/2.
//  Copyright © 2019 lvyingliang200. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark -- 常用值函数
static inline CGFloat realValue(CGFloat value) {
    return value / 375.f * CGRectGetWidth([UIScreen mainScreen].bounds);
}

static inline CGFloat screenWidth() {
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}

static inline CGFloat screenHeight() {
    return CGRectGetHeight([UIScreen mainScreen].bounds);
}

static inline CGFloat statusBarHeight() {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

static inline BOOL isFullScreen() {
    return statusBarHeight() > 20 ? YES : NO;
}

static inline CGFloat navigationBarHeight() {
    return 44.0;
}

static inline CGFloat navigationHeight() {
    return navigationBarHeight() + statusBarHeight();
}

static inline CGFloat tabBarHeight() {
    return 49.0;
}

/// 底部安全区域高度
static inline CGFloat bottomSafeHeight() {
    return isFullScreen() ? 34.0 : 0.0;
}


#pragma mark -- 颜色值常量函数
static inline UIColor* sameColor(CGFloat colorValue) {
    return [UIColor colorWithRed:colorValue/255.0 green:colorValue/255.0 blue:colorValue/255.0 alpha:1.0];
}

/// 字体黑色
static inline UIColor* colorTextBlack() {
    return sameColor(51.0);
}
/// 字体淡黑
static inline UIColor* colorTextLightBlack() {
    return sameColor(102.0);
}
/// 字体灰色
static inline UIColor* colorTextGray() {
    return sameColor(153.0);
}
/// 字体灰色
static inline UIColor* colorF2() {
    return sameColor(242.0);
}

#pragma mark -- 字体
static inline UIFont *fontSize(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

#pragma mark -- 震动反馈
static inline void rs_feedBack() {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedBackGenertor impactOccurred];
    }
}

#pragma mark -- 判断控制器是否正在显示
static inline BOOL isVisiableViewController(UIViewController *viewController) {
    return (viewController.isViewLoaded && viewController.view.window);
}

#endif /* Constant_h */
