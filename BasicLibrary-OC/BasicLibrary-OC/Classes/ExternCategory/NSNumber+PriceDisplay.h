//
//  NSNumber+PriceDisplay.h
//  risen-user-ios
//
//  Created by 吕英良 on 2019/5/20.
//  Copyright © 2019 Risense. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (PriceDisplay)

/**
 处理价格
 @return 价格对应的字符串 ：小数点后有值的保留，没有值的不显示小数点
 */
- (NSString *)handlePrice;
- (NSString *)handlePriceWithoutSymbol;
- (NSMutableAttributedString *)handlePriceAndSmallSymbol;

/**
 转换金额
 不损失金额精度
 @return DecimalNumber
 */
- (NSDecimalNumber *)convertDecimal;

@end

NS_ASSUME_NONNULL_END
