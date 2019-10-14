//
//  DemoSelectionVC.m
//  ZXEmptyViewDemo
//
//  Created by ZXLee on 2019/10/7.
//  Copyright © 2019 ZXLee. All rights reserved.
//

#import "DemoSelectionVC.h"
#import "DemoUIViewVC.h"
#import "DemoTableViewVC.h"
#import "DemoCollectionViewVC.h"
#import "DemoCustomViewVC.h"
#import "DemoMain.h"
#import "UIViewController+Dealloc.h"
@interface DemoSelectionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@end

@implementation DemoSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZXEmptyViewDemo";
    self.datas = @[@"显示在控制器View上的ZXEmptyView",@"显示在tableView上的ZXEmptyView",@"显示在collectionView上的ZXEmptyView",@"完全自定义的EmptyView",@"模拟真实项目使用环境的Demo"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *vc;
    if(indexPath.row == 0){
        vc = [[DemoUIViewVC alloc]init];
    }else if(indexPath.row == 1){
        vc = [[DemoTableViewVC alloc]init];
    }else if(indexPath.row == 2){
        vc = [[DemoCollectionViewVC alloc]init];
    }else if(indexPath.row == 3){
        vc = [[DemoCustomViewVC alloc]init];
    }else if(indexPath.row == 4){
        vc = [[DemoMain alloc]init];
    }
    if(vc){
        vc.title = NSStringFromClass([vc class]);
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
