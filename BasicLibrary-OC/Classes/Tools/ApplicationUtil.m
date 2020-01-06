//
//  ApplicationUtil.m
//  BasicLibrary-OC
//
//  Created by 吕英良 on 2020/1/6.
//

#import "ApplicationUtil.h"

@implementation ApplicationUtil

+ (void)openAppWithUrlScheme:(NSString *)urlScheme
{
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:urlScheme];
    if ([application canOpenURL:url]) {
        [application openURL:url];
    }
}

+ (void)makeATelephoneCallWithPhoneNumber:(NSString *)phoneNumber
{
    NSString *urlStr = [NSString stringWithFormat:@"telprompt://%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}

#pragma mark -- 是否打开推送检测
+ (BOOL)isUserEnabledNotification
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    BOOL notEnable = UIUserNotificationTypeNone == setting.types;
    return !notEnable;
}

@end
