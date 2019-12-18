//
//  UILabel+Copy.m
//  risen_ business_ios1
//
//  Created by 吕英良 on 2019/3/21.
//  Copyright © 2019 Risense. All rights reserved.
//

#import "UILabel+Copy.h"
#import <objc/runtime.h>

@implementation UILabel (Copy)

- (BOOL)canCopy
{
    return [objc_getAssociatedObject(self, @selector(canCopy)) boolValue];
}

- (void)setCanCopy:(BOOL)canCopy
{
    objc_setAssociatedObject(self, @selector(canCopy),
                             [NSNumber numberWithBool:canCopy], OBJC_ASSOCIATION_ASSIGN);
    [self addLongPressGestureRecognizer];
}

#pragma mark - 添加长按手势和菜单消失的通知
- (void)addLongPressGestureRecognizer
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerWillHide) name:UIMenuControllerWillHideMenuNotification object:nil];
}

#pragma mark 长按手势处理
- (void)longPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyAction)];
        [[UIMenuController sharedMenuController] setMenuItems:@[copyItem]];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
        self.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    }
}

#pragma mark 菜单消失 处理界面
- (void)menuControllerWillHide
{
    [self resignFirstResponder];
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark 使Label能陈伟第一响应者
- (BOOL)canBecomeFirstResponder
{
    return [objc_getAssociatedObject(self, @selector(canCopy)) boolValue];
}

#pragma mark 指定Label可以响应的方法（这里只用到复制）
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copyAction)) {
        return YES;
    }
    return NO;
}

#pragma mark 点击复制按钮后的处理
- (void)copyAction
{
    [self resignFirstResponder];
    //UIPasteboard 的string只能接受 NSString 类型，当Label设置的是attributedText时需要进行转换
    UIPasteboard *pastboard = [UIPasteboard generalPasteboard];
    if (self.text) {
        pastboard.string = self.text;
    }else{
        pastboard.string = self.attributedText.string;
    }
    
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark
- (void)dealloc
{
    [self resignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}

@end
