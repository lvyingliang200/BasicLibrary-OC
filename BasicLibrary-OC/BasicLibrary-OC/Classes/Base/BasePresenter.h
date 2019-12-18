//
//  BasePresenter.h
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasePresenter<__covariant ViewProtocol> : NSObject

@property (nonatomic, weak) ViewProtocol protocolView;

/// 初始化并绑定视图层
/// @param protocolView 实现ViewProtocol协议的视图层
- initWithProtocolView:(ViewProtocol)protocolView;

/// 绑定视图层
/// @param protocolView 实现ViewProtocol协议的视图层
- (void)bindView:(ViewProtocol)protocolView;

/// 解绑视图层
- (void)unbindView;

@end

NS_ASSUME_NONNULL_END
