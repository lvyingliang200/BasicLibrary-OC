//
//  BaseResponse.h
//  AFNetworking
//
//  Created by 吕英良 on 2020/1/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponse : NSObject

/// 响应代码:
/// [0->正常,1->失败,-1->错误]
@property (nonatomic) NSInteger code;

/// 响应消息
@property (nonatomic,strong) NSString *msg;

@end

NS_ASSUME_NONNULL_END
