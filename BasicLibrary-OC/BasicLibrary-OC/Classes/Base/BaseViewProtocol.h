//
//  BaseViewProtocol.h
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <NSObject>

@optional

/// 展示加载中视图
- (void)showHUD;

/// 隐藏加载中视图
- (void)hideHUD;


/// 返回并提示错误信息
/// @param errorMsg 错误信息
- (void)backWithErrorMsg:(NSString *)errorMsg;

@end

NS_ASSUME_NONNULL_END
