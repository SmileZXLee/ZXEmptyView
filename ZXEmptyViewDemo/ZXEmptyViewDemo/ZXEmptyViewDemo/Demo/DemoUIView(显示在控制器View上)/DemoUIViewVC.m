//
//  DemoUIViewVC.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/8.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "DemoUIViewVC.h"
#import "ZXEmptyView.h"
@interface DemoUIViewVC ()

@end

@implementation DemoUIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view zx_setEmptyView:@"DemoEmptyView"];
    [self.view zx_showEmptyView];
    self.view.zx_emptyContentView.zx_type = 1;
    self.view.zx_emptyContentView.zx_detailLabel.text = @"这是一个显示在控制器view上面的ZXEmptyView，3秒后这段文字以及标题将被改变";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.zx_emptyContentView.zx_detailLabel.text = @"文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变文字改变";
        self.view.zx_emptyContentView.zx_titleLabel.text = @"网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误网络错误";
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
