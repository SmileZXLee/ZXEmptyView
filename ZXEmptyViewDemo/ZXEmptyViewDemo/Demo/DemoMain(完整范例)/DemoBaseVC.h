//
//  DemoBaseVC.h
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/14.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXEmptyView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DemoBaseVC : UIViewController

/**
 初始化EmptyView

 @param view EmptyView添加到谁身上
 @param sel 按钮点击之后调用的方法
 */
- (void)setEmptyViewForView:(UIView *)view clickedSelector:(SEL)sel;

/**
 处理网络错误信息

 @param error 网络错误码，传空就代表没有错误
 */
- (void)handleError:(NSNumber *)error;
@end

NS_ASSUME_NONNULL_END
