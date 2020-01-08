//
//  WebService.m
//  BasicLibrary-OC
//
//  Created by 吕英良 on 2020/1/8.
//

#import "WebService.h"
#import <MJExtension/MJExtension.h>

static AFHTTPSessionManager *manager;

@implementation WebService

+ (instancetype)defaultService
{
    static WebService *service;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[WebService alloc] init];
    });
    
    return service;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 30.0;
        config.timeoutIntervalForResource = 30.0;
        manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
    }
    return self;
}

- (void)postJsonWithURLString:(NSString *)URLString
            requestParameters:(NSObject *)request callback:(ResponseCallback)callback
{
    [self configHeaderAndResponseTypes];
    [manager POST:URLString parameters:request.mj_keyValues progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        BaseResponse *response = [BaseResponse mj_objectWithKeyValues:responseObject];
        NSString *msg = [self checkResponse:response];
        if (!callback) return;
        if(success && msg == nil){
            callback(YES, nil);
        }else{
            callback(NO, msg);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !callback ? : callback(NO,nil);
    }];
}

- (void)postJsonWithURLString:(NSString *)URLString
            requestParameters:(NSObject *)request responseClassName:(NSString *)responseName callback:(ResponseInfoCallback)callback
{
    [self configHeaderAndResponseTypes];
    
    [manager POST:URLString parameters:request.mj_keyValues progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        BaseResponse *response = [NSClassFromString(responseName) mj_objectWithKeyValues:responseObject];
        NSString *msg = [self checkResponse:response];
        BaseResponse *response = [BaseResponse mj_objectWithKeyValues:responseObject];
        NSString *msg = [self checkResponse:response];
        if (!callback) return;
        if(success && msg == nil){
            callback(YES, nil, response);
        }else{
            callback(NO, msg, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ? : callback(NO, msg, nil);
    }];
    
}

- (void)configHeaderAndResponseTypes
{
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    if (_headParam!=nil && _headParam.allKeys.count > 0) {//添加请求头
        for(NSObject * key in _headParam.allKeys){
            [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",_headParam[key]] forHTTPHeaderField:[NSString stringWithFormat:@"%@",key]];
        }
    }
}

- (NSString *)checkResponse:(BaseResponse *)response
{
    if(response != nil && response.code == 0){
        return nil;
    }else if(response != nil && (response.code == 100 || response.code == 10500)){
//        [[AppContext itself] logout: @"登录错误或超时,请重新登录"];
        return response.msg;
    }else if(response!=nil){
        return response.msg;
    }else{
        return @"服务器无法响应,请检查网络";
    }
}


@end
