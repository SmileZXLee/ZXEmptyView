//
//  ZXEmptyTopImageView.m
//  ZXEmptyView
//
//  Created by ZXLee on 2019/10/2.
//  Copyright © 2019 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXEmptyView

#import "ZXEmptyTopImageView.h"
#import "UIView+ZXEmptyLayout.h"
@interface ZXEmptyTopImageView()
@end
@implementation ZXEmptyTopImageView

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"zx_fixTop"];
    [self removeObserver:self forKeyPath:@"zx_fixWidth"];
    [self removeObserver:self forKeyPath:@"image"];
    [self removeObserver:self forKeyPath:@"zx_fixHeight"];
    [self removeObserver:self forKeyPath:@"zx_fixSize"];
}

@end
