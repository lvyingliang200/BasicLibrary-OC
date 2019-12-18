//
//  NSNumber+PriceDisplay.m
//  risen-user-ios
//
//  Created by 吕英良 on 2019/5/20.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "NSNumber+PriceDisplay.h"

@implementation NSNumber (PriceDisplay)

- (NSMutableAttributedString *)handlePriceAndSmallSymbol {
    NSMutableAttributedString *priceAstr;
    NSString *priceStr;
    NSInteger priceInterger = self.integerValue;
    NSInteger remainder = priceInterger % 100;
    NSInteger result = priceInterger / 100;
    if (remainder == 0) {
        priceStr = [NSString stringWithFormat:@"￥%ld",(long)result];
    }else{
        NSString *suffixStr = @"";
        if (remainder < 10) {
            suffixStr = [NSString stringWithFormat:@"0%ld",(long)remainder];
        }else{
            NSInteger subRemainder = remainder % 10;
            NSInteger subResult = remainder / 10;
            if (subRemainder == 0) {
                suffixStr = [NSString stringWithFormat:@"%ld",(long)subResult];
            }else{
                suffixStr = [NSString stringWithFormat:@"%ld",(long)remainder];
            }
        }
        priceStr = [NSString stringWithFormat:@"￥%ld.%@",(long)result,suffixStr];
    }
    priceAstr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [priceAstr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10.0] range:NSMakeRange(0, 1)];
    return priceAstr;
}

- (NSString *)handlePrice
{
    NSString *priceStr;
    NSInteger priceInterger = self.integerValue;
    NSInteger remainder = priceInterger % 100;
    NSInteger result = priceInterger / 100;
    if (remainder == 0) {
        priceStr = [NSString stringWithFormat:@"￥%ld",(long)result];
    }else{
        NSString *suffixStr = @"";
        if (remainder < 10) {
            suffixStr = [NSString stringWithFormat:@"0%ld",(long)remainder];
        }else{
            NSInteger subRemainder = remainder % 10;
            NSInteger subResult = remainder / 10;
            if (subRemainder == 0) {
                suffixStr = [NSString stringWithFormat:@"%ld",(long)subResult];
            }else{
                suffixStr = [NSString stringWithFormat:@"%ld",(long)remainder];
            }
        }
        priceStr = [NSString stringWithFormat:@"￥%ld.%@",(long)result,suffixStr];
    }
    return priceStr;
}

- (NSString *)handlePriceWithoutSymbol
{
    NSString *price = [[self handlePrice] stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    return price;
}

- (NSDecimalNumber *)convertDecimal {
   return [NSDecimalNumber decimalNumberWithDecimal:[self decimalValue]];
}

@end
