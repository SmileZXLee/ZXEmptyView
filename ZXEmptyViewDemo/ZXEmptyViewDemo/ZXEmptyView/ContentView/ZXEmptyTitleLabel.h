//
//  ZXEmptyTitleLabel.h
//  ZXEmptyView
//
//  Created by ZXLee on 2019/10/2.
//  Copyright © 2019 ZXLee. All rights reserved.
//  https://github.com/SmileZXLee/ZXEmptyView

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXEmptyTitleLabel : UILabel

/**
 固定titleLabel的宽度
 */
@property(assign,nonatomic)CGFloat zx_fixWidth;

/**
 固定titleLabel距离顶部高度（默认为10）
 */
@property(assign,nonatomic)CGFloat zx_fixTop;

/**
 修改titleLabel的frame（当titleLabel的frame改变时调用此block）
 
 @param block 根据view原始frame(自动计算)，返回修改后的frame
 */
@property(copy,nonatomic)CGRect (^zx_handleFrame)(CGRect orgFrame);
@end

NS_ASSUME_NONNULL_END
