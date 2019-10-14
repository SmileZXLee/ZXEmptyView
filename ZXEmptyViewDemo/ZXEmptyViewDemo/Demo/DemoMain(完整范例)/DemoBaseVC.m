//
//  DemoBaseVC.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/14.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "DemoBaseVC.h"
#import "ZXEmptyView.h"
@interface DemoBaseVC ()
@property (strong, nonatomic) ZXEmptyContentView *emptyView;
@end

@implementation DemoBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setEmptyViewForView:(UIView *)view clickedSelector:(SEL)sel{
    [view zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedTarget:self selector:sel];
    self.emptyView = view.zx_emptyContentView;
}

- (void)handleError:(NSNumber *)error{
    if(!self.emptyView){
        return;
    }
    if(error){
        //设置显示网络错误的样式
        self.emptyView.zx_emptyContentView.zx_type = 1;
        //网络请求错误，可以根据错误原因重新设置错误提示内容
        //这一部分可以直接封装在DemoEmptyView中，同样用zx_type控制样式，此处只是为了便于阅读
        int errCode = [error intValue];
        //(0：请求超时，1：网络未连接，2：服务器错误)
        if(errCode == 0){
            self.emptyView.zx_titleLabel.text = @"请求超时";
            self.emptyView.zx_detailLabel.text = @"这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容";
        }else if(errCode == 1){
            self.emptyView.zx_titleLabel.text = @"网络未连接";
            self.emptyView.zx_detailLabel.text = @"这是网络未连接的时候显示的内容这是网络未连接的时候显示的内容这是网络未连接的时候显示的内容这是网络未连接的时候显示的内容";
        }else if(errCode == 2){
            self.emptyView.zx_titleLabel.text = @"服务器错误";
            self.emptyView.zx_detailLabel.text = @"这是服务器错误的时候显示的内容这是服务器错误的时候显示的内容这是服务器错误的时候显示的内容这是服务器错误的时候显示的内容";
        }
    }else{
        //没有错误，显示暂无数据的样式
        self.emptyView.zx_type = 0;
    }
}
@end
