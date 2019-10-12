//
//  DemoTableViewVC.m
//  ZXEmptyViewDemo
//
//  Created by ZXLee on 2019/10/5.
//  Copyright © 2019 ZXLee. All rights reserved.
//

#import "DemoTableViewVC.h"
#import "ZXEmptyView.h"
#import "DemoEmptyView.h"

#import "MBProgressHUD.h"
typedef void (^requestDataBlock)(BOOL result,id data);
@interface DemoTableViewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *datas;
@property (assign, nonatomic) BOOL hasHeaderView;
@property (weak, nonatomic) IBOutlet UIButton *netErrBtn;

@end

@implementation DemoTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.datas = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    [self.tableView zx_setEmptyView:[DemoEmptyView class]];
    self.tableView.zx_emptyContentView.zx_btnClickedBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"点击了重新加载...");
        [weakSelf.netErrBtn setTitle:@"网络正常" forState:UIControlStateNormal];
        [weakSelf netErrorAction:weakSelf.netErrBtn];
    };
    
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
    if(!self.hasHeaderView){
        return nil;
    }
    UILabel *headerViewLabel = [[UILabel alloc]init];
    headerViewLabel.text = @"这是一个headerView";
    headerViewLabel.textAlignment = NSTextAlignmentCenter;
    headerViewLabel.backgroundColor = [UIColor yellowColor];
    return headerViewLabel;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.hasHeaderView ? 160 : CGFLOAT_MIN;
}
#pragma mark - Actions
#pragma mark 点击了【有数据】/【无数据】
- (IBAction)hasDataAction:(UIButton *)sender{
    __weak typeof(self) weakSelf = self;
    if([sender.currentTitle isEqualToString:@"有数据"]){
        //点击了有数据
        [self requestDataCallBack:^(BOOL result, id data) {
            weakSelf.datas = data;
            [weakSelf.tableView reloadData];
        }error:NO hasData:YES];
        [sender setTitle:@"无数据" forState:UIControlStateNormal];
    }else{
        //点击了无数据
        [self requestDataCallBack:^(BOOL result, id data) {
            weakSelf.datas = data;
            [weakSelf.tableView reloadData];
        }error:NO hasData:NO];
        [sender setTitle:@"有数据" forState:UIControlStateNormal];
    }
}

#pragma mark 点击了【有HeaderView】/【无HeaderView】
- (IBAction)hasHeaderViewAction:(UIButton *)sender{
    if([sender.currentTitle isEqualToString:@"有HeaderView"]){
        //点击了有HeaderView
        self.hasHeaderView = YES;
        [sender setTitle:@"无HeaderView" forState:UIControlStateNormal];
    }else{
        //点击了无HeaderView
        self.hasHeaderView = NO;
        [sender setTitle:@"有HeaderView" forState:UIControlStateNormal];
    }
    [self.tableView reloadData];
}

#pragma mark 点击了【网络错误】/【网络正常】
- (IBAction)netErrorAction:(UIButton *)sender{
    __weak typeof(self) weakSelf = self;
    if([sender.currentTitle isEqualToString:@"网络错误"]){
        //点击了网络错误
        self.tableView.zx_emptyContentView.zx_type = 1;
        [self requestDataCallBack:^(BOOL result, id data) {
            weakSelf.datas = data;
            [weakSelf.tableView reloadData];
        }error:YES hasData:NO];
        [sender setTitle:@"网络正常" forState:UIControlStateNormal];
    }else{
        //点击了网络正常
        self.tableView.zx_emptyContentView.zx_type = 0;
        [self requestDataCallBack:^(BOOL result, id data) {
            weakSelf.datas = data;
            [weakSelf.tableView reloadData];
        }error:NO hasData:YES];
        [sender setTitle:@"网络错误" forState:UIControlStateNormal];
        
    }
}

#pragma mark - 网络请求，获取数据
- (void)requestDataCallBack:(requestDataBlock)requestDataBlock error:(BOOL)error hasData:(BOOL)hasData{
    [self.tableView zx_startLoading];
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView zx_endLoading];
        [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        if(error){
            requestDataBlock(NO,nil);
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
