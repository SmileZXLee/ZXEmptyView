//
//  UIViewController+Dealloc.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/11.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "UIViewController+Dealloc.h"
@implementation UIViewController (Dealloc)

- (void)dealloc{
#ifdef DEBUG
    NSLog(@"%@销毁了",[self class]);
#endif
}
@end
