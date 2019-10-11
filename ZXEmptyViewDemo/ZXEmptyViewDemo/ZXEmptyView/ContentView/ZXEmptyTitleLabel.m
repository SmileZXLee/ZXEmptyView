//
//  ZXEmptyTitleLabel.m
//  ZXEmptyView
//
//  Created by ZXLee on 2019/10/2.
//  Copyright © 2019 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXEmptyView

#import "ZXEmptyTitleLabel.h"

@implementation ZXEmptyTitleLabel

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"zx_fixTop"];
    [self removeObserver:self forKeyPath:@"zx_fixWidth"];
    [self removeObserver:self forKeyPath:@"text"];
    [self removeObserver:self forKeyPath:@"attributedText"];
}

@end
