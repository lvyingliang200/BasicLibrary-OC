//
//  WebService.h
//  BasicLibrary-OC
//
//  Created by 吕英良 on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "BaseResponse.h"

typedef void(^ResponseCallback)(BOOL success, NSString * _Nullable msg);
typedef void(^ResponseInfoCallback)(BOOL success, NSString * _Nullable msg, BaseResponse * _Nullable response);

NS_ASSUME_NONNULL_BEGIN

@interface WebService : NSObject

/// 请求头参数
@property (nonatomic,strong) NSMutableDictionary *headParam;

/// 不带返回信息的请求
- (void)requestWithURLString:(NSString *)URLString
           requestParameters:(NSObject *)request callback:(ResponseCallback)callback;

/// 需要返回信息的请求
/// @param URLString 请求地址
/// @param request 请求对象
/// @param responseName 返回信息类名
/// @param callback 回调块
- (void)requestWithURLString:(NSString *)URLString
           requestParameters:(NSObject *)request responseClassName:(NSString *)responseName callback:(ResponseInfoCallback)callback;
@end

NS_ASSUME_NONNULL_END
