//
//  DemoCustomViewVC.m
//  ZXEmptyViewDemo
//
//  Created by ZXLee on 2019/10/8.
//  Copyright © 2019 ZXLee. All rights reserved.
//

#import "DemoCustomViewVC.h"
#import "ZXEmptyView.h"
#import "DemoCustomEmptyView.h"
@interface DemoCustomViewVC ()

@end

@implementation DemoCustomViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DemoCustomEmptyView *customEmptyView = [[[NSBundle mainBundle]loadNibNamed:@"DemoCustomEmptyView" owner:nil options:nil]lastObject];
    customEmptyView.backgroundColor = [UIColor yellowColor];
    customEmptyView.zx_size = CGSizeMake(300, 200);
    [self.view zx_setCustomEmptyView:customEmptyView];
    [self.view zx_showEmptyView];
}


@end
