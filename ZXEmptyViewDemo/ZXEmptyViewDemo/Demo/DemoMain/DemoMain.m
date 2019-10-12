//
//  DemoMain.m
//  ZXEmptyViewDemo
//
//  Created by 李兆祥 on 2019/10/12.
//  Copyright © 2019 李兆祥. All rights reserved.
//  建议直接看这个Demo

#import "DemoMain.h"
#import "MBProgressHUD.h"
#import "ZXEmptyView.h"
#warning 请查看此处完整的创建步骤
/*
构建一个完整的EmptyView有3步
1.在DemoEmptyView中初始化EmptyView的样式和默认值
2.在需要显示EmptyView的控制器中调用view的zx_setEmptyView...
3.在网络异常和正常的时候根据zx_type切换样式，也可以自己定义切换的方式，如通过类方法传参数等等
 */
typedef void (^requestDataBlock)(BOOL result,id data);
@interface DemoMain ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *datas;
@property (strong, nonatomic) UILabel *headerViewLabel;
@end

@implementation DemoMain
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSMutableArray array];
    [self initTableView];
    [self initEmptyView];
}

#pragma mark 设置tableView
- (void)initTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark 设置EmptyView
- (void)initEmptyView{
    [self.tableView zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedTarget:self selector:@selector(requestTableViewData)];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *str = self.datas[indexPath.row];
    cell.textLabel.text = str;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(self.headerViewLabel){
        return self.headerViewLabel;
    }
    UILabel *headerViewLabel = [[UILabel alloc]init];
    headerViewLabel.text = @"这是一个模拟真实项目使用环境的Demo\n点击此处来模拟进行了网络请求";
    headerViewLabel.textAlignment = NSTextAlignmentCenter;
    headerViewLabel.numberOfLines = 0;
    headerViewLabel.backgroundColor = [UIColor yellowColor];
    headerViewLabel.userInteractionEnabled = YES;
    [headerViewLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(requestTableViewData)]];
    self.headerViewLabel = headerViewLabel;
    return headerViewLabel;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 140;
}


#pragma mark - 网络请求，获取数据
#pragma mark 请求TableView的数据
- (void)requestTableViewData{
    __weak typeof(self) weakSelf = self;
    int netError = arc4random() % 2;
    //随机是否有数据，0为没有数据，1为有数据
    int hasData = arc4random() % 2;
    if(netError){
        self.headerViewLabel.text = @"以下显示网络错误的情况\n点击此处来模拟重新进行了网络请求";
    }else{
        if(hasData){
            self.headerViewLabel.text = @"以下显示有数据的情况\n点击此处来模拟重新进行了网络请求";
        }else{
            self.headerViewLabel.text = @"以下显示没有数据的情况\n点击此处来模拟重新进行了网络请求";
        }
    }
    [self requestDataCallBack:^(BOOL result, id data) {
        if(result == NO){
            //网络请求错误
            [weakSelf.datas removeAllObjects];
            //已经在DemoEmptyView中设置了，1为网络错误样式，0为无数据样式，这边0，1可以改成枚举，更便于阅读
            weakSelf.tableView.zx_emptyContentView.zx_type = 1;
            //网络请求错误，可以根据错误原因重新设置错误提示内容
            //这一部分可以直接封装在DemoEmptyView中，同样用zx_type控制样式，此处只是为了便于阅读
            int errCode = [data intValue];
            //(0：请求超时，1：网络未连接，2：服务器错误)
            if(errCode == 0){
                weakSelf.tableView.zx_emptyContentView.zx_titleLabel.text = @"请求超时";
                weakSelf.tableView.zx_emptyContentView.zx_detailLabel.text = @"这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容";
            }else if(errCode == 1){
                weakSelf.tableView.zx_emptyContentView.zx_titleLabel.text = @"网络未连接";
                weakSelf.tableView.zx_emptyContentView.zx_detailLabel.text = @"这是网络未连接的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容";
            }else if(errCode == 2){
                weakSelf.tableView.zx_emptyContentView.zx_titleLabel.text = @"服务器错误";
                weakSelf.tableView.zx_emptyContentView.zx_detailLabel.text = @"这是服务器错误的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容这是请求超时的时候显示的内容";
            }
            
        }else{
            //网络请求成功
            weakSelf.datas = data;
            weakSelf.tableView.zx_emptyContentView.zx_type = 0;
        }
        [weakSelf.tableView reloadData];
    }error:netError hasData:hasData];
}

#pragma mark 假装进行了网络请求，返回假数据
- (void)requestDataCallBack:(requestDataBlock)requestDataBlock error:(BOOL)error hasData:(BOOL)hasData{
    //[self.tableView zx_startLoading];
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[self.tableView zx_endLoading];
        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        if(error){
            //网络请求错误，返回随机的错误码0-2(0：请求超时，1：网络未连接，2：服务器错误)
            int code = arc4random() % 3;
            requestDataBlock(NO,[NSNumber numberWithInt:code]);
        }else{
            NSMutableArray *dataArr = [NSMutableArray array];
            if(hasData){
                for(NSUInteger i = 0;i < 20;i++){
                    NSString *str = [NSString stringWithFormat:@"第%lu行",(unsigned long)i];
                    [dataArr addObject:str];
                }
            }
            requestDataBlock(YES,dataArr);
        }
        
    });
}
@end
