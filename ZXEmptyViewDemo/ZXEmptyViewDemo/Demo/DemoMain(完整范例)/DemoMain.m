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
4.以上操作可以直接封装在父类控制器中，子类控制器仅需要两行代码就可以完成全部功能（见第34行和第94行）
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
    [self initTableView];
    //初始化EmptyView样式，详见父类:DemoBaseVC
    [self setEmptyViewForView:self.tableView clickedSelector:@selector(requestTableViewData)];
}

#pragma mark 设置tableView
- (void)initTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
        //若无错误，error为nin，若有错误，error为具体的错误码
        NSNumber *error = result ? nil : data;
        //处理网络错误的情况，详见父类:DemoBaseVC
        [weakSelf handleError:error];
        weakSelf.datas = result ? data : nil;
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
