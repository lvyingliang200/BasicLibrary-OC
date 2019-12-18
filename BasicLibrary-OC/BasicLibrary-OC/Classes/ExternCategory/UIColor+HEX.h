//
//  UIColor+HEX.h
//  YF
//
//  Created by ZJZ on 2016/12/5.
//  Copyright © 2016年 Candy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

/// 创建颜色含有alpha
/// @param color 16进制色值 如：[e62d4f 、#e62d4f]
/// @param alpha 透明度值
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 创建颜色
/// @param color 16进制色值 如：[e62d4f 、#e62d4f]
+ (UIColor *)colorWithHexString:(NSString *)color;


@end
