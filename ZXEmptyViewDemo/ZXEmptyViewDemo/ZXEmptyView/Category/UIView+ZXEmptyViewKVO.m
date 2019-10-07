//
//  UIView+ZXEmptyViewKVO.m
//  ZXEmptyView
//
//  Created by ZXLee on 2019/10/4.
//  Copyright © 2019 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXEmptyView

#import "UIView+ZXEmptyViewKVO.h"

@implementation UIView (ZXEmptyViewKVO)

-(void)zx_obsKey:(NSString *)key handler:(obsResultHandler)handler{
    [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:(__bridge_retained void *)([handler copy])];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if(object == self){
        obsResultHandler handler = (__bridge obsResultHandler)context;
        handler(change[@"new"],change[@"old"],self);
    }
}
@end
