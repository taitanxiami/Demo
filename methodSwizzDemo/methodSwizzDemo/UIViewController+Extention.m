//
//  UIViewController+Extention.m
//  methodSwizzDemo
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "UIViewController+Extention.h"
#import <objc/runtime.h>
@implementation UIViewController (Extention)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originalMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_viewDidLoad));
        BOOL didAddMethod = class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod([self class], @selector(swizzled_viewDidLoad), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
- (void)swizzled_viewDidLoad {
    [self swizzled_viewDidLoad];
    if (![self isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
        self.view.backgroundColor = [UIColor redColor];
    }
}
@end

