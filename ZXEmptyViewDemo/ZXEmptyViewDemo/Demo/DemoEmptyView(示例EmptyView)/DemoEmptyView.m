//
//  DemoEmptyView.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/7.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "DemoEmptyView.h"

@implementation DemoEmptyView

- (void)zx_customSetting{
    self.zx_type = 0;
}

- (void)setZx_type:(int)zx_type{
    if(zx_type == 0){
        self.zx_topImageView.image = [UIImage imageNamed:@"nodata_icon"];
        self.zx_topImageView.zx_fixWidth = 100;
        self.zx_titleLabel.zx_fixTop = 20;
        self.zx_titleLabel.text = @"暂无数据";
        self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        self.zx_detailLabel.textColor = [UIColor lightGrayColor];
        self.zx_detailLabel.font = [UIFont systemFontOfSize:14];
        self.zx_detailLabel.text = @"啊偶，这里没有东西哦~~";
        
        [self.zx_actionBtn setTitle:nil forState:UIControlStateNormal];
        
    }else{
        self.zx_topImageView.image = [UIImage imageNamed:@"netErr_icon"];
        self.zx_topImageView.zx_fixWidth = 100;
        self.zx_titleLabel.text = @"网络异常";
        self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        self.zx_detailLabel.textColor = [UIColor lightGrayColor];
        self.zx_detailLabel.font = [UIFont systemFontOfSize:14];
        self.zx_detailLabel.text = @"网络错误，请检查网络设置，长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试网络错误，请检查网络设置，长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试网络错误，请检查网络设置，长度测试长度测";
        
        self.zx_actionBtn.zx_fixTop = 15;
        self.zx_actionBtn.zx_additionWidth = 15;
        self.zx_actionBtn.zx_additionHeight = 15;
        self.zx_actionBtn.layer.cornerRadius = 5;
        [self.zx_actionBtn setTitle:@"点击重试" forState:UIControlStateNormal];
        self.zx_actionBtn.backgroundColor = [UIColor orangeColor];
        [self.zx_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

@end
