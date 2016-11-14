//
//  UIViewController+backgroundColor.m
//  runtime动态添加属性
//
//  Created by iosDeveloper on 16/9/28.
//  Copyright © 2016年 恒众鑫智能技术. All rights reserved.
//

#import "UIViewController+backgroundColor.h"

#import <objc/objc-runtime.h>


#define WXGGlobalBackgroundColor [UIColor redColor]
@implementation UIViewController (backgroundColor)

const void *key;

const void *key2;

-(void)setColor:(UIColor *)color{
    
    objc_setAssociatedObject(self, key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(UIColor *)color{
    
    return objc_getAssociatedObject(self, key);
}


-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, key2, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(NSString *)name{

    return objc_getAssociatedObject(self, key2);
}






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
       self.view.backgroundColor = WXGGlobalBackgroundColor;
        NSLog(@"%@ loaded", self);
    if (![self isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
        self.view.backgroundColor = WXGGlobalBackgroundColor;
    }
}
@end
