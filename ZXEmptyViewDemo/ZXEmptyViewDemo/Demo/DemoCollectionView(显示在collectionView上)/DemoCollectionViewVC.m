//
//  DemoCollectionViewVC.m
//  ZXEmptyViewDemo
//
//  Created by ZXLee on 2019/10/7.
//  Copyright © 2019 ZXLee. All rights reserved.
//

#import "DemoCollectionViewVC.h"
#import "DemoCollectionViewCell.h"
#import "DemoCollectionHeaderView.h"

#import "ZXEmptyView.h"
@interface DemoCollectionViewVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *datas;
@end

@implementation DemoCollectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSMutableArray array];
    self.collectionView.backgroundColor = [UIColor greenColor];
    for(NSUInteger i = 0;i < 20;i++){
        NSString *str = [NSString stringWithFormat:@"第%lu行",i];
        [self.datas addObject:str];
    }
    [self initCollectionView];
    [self.collectionView zx_setEmptyView:@"DemoEmptyView"];
    self.collectionView.zx_emptyContentView.zx_detailLabel.text = @"具体操作和tableView相同，可以看一下tableView那个Demo";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.datas removeAllObjects];
        [self.collectionView reloadData];
    });
}

#pragma mark - Private
#pragma mark 初始化collectionView
- (void)initCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 3 * 5) / 3, 100);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.delegate = self; //设置代理
    self.collectionView.dataSource = self;   //设置数据来源
    [self.collectionView registerNib:[UINib nibWithNibName:@"DemoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DemoCollectionViewCell"];
    [self.collectionView registerClass:[DemoCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DemoCollectionHeaderView"];
}

#pragma mark - UICollectionViewDataSource & UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DemoCollectionViewCell" forIndexPath:indexPath];
    cell.demoLabel.text = self.datas[indexPath.item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DemoCollectionHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DemoCollectionHeaderView" forIndexPath:indexPath];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 120);
    return size;
}

@end
