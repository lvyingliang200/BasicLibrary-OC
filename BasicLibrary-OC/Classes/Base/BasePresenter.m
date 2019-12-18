//
//  BasePresenter.m
//  cydr_ios_user
//
//  Created by 吕英良 on 2019/11/28.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "BasePresenter.h"

@implementation BasePresenter

- (id)initWithProtocolView:(id)protocolView
{
    self = [super init];
    if (self) {
        [self bindView:protocolView];
    }
    return self;
}

- (void)bindView:(id)protocolView
{
    _protocolView = protocolView;
}

- (void)unbindView
{
    _protocolView = nil;
}

@end
