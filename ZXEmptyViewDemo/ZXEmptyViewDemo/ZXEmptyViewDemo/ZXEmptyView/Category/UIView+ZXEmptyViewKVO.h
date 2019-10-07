//
//  UIView+ZXEmptyViewKVO.h
//  ZXEmptyView
//
//  Created by 李兆祥 on 2019/10/4.
//  Copyright © 2019 李兆祥. All rights reserved.
//  https://github.com/SmileZXLee/ZXEmptyView

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^obsResultHandler) (id newData, id oldData,id owner);
@interface NSObject (ZXEmptyViewKVO)

/**
 KVO监听

 @param key 监听的key
 @param handler 监听结果回调
 */
-(void)zx_obsKey:(NSString *)key handler:(obsResultHandler)handler;
@end

NS_ASSUME_NONNULL_END
