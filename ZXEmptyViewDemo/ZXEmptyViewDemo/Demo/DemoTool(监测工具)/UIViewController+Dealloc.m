//
//  UIViewController+Dealloc.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/11.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "UIViewController+Dealloc.h"
#import "NSObject+ZXEmptySwizzleMethod.h"
@implementation UIViewController (Dealloc)
+ (void)load{
    zx_swizzleMethod(self, NSSelectorFromString(@"dealloc"), @selector(zx_dealloc));
}

- (void)zx_dealloc{
    #ifdef DEBUG
        NSLog(@"%@销毁了",[self class]);
    #endif
    [self zx_dealloc];
}
@end
