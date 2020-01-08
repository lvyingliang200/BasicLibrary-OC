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

@end

NS_ASSUME_NONNULL_END
