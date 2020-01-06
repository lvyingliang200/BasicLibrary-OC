//
//  ApplicationUtil.h
//  BasicLibrary-OC
//
//  Created by 吕英良 on 2020/1/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApplicationUtil : NSObject

/// 根据URL Scheme 打开响应App
/// @param urlScheme App 的URL Scheme
+ (void)openAppWithUrlScheme:(NSString *)urlScheme;

/// 拨打电话
+ (void)makeATelephoneCallWithPhoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
