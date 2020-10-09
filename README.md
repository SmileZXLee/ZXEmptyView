# ZXEmptyView
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/smilezxlee/ZXEmptyView/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/ZXEmptyView.svg?style=flat)](http://cocoapods.org/?q=ZXRequestBlock)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/ZXEmptyView.svg?style=flat)](http://cocoapods.org/?q=ZXRequestBlock)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208.0%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
## 安装
### 通过CocoaPods安装
```ruby
pod 'ZXEmptyView'
```
### 手动导入
* 将ZXEmptyView拖入项目中。

### 导入头文件
```objective-c
#import "ZXEmptyView.h"
```
***

## 起步
### 了解ZXEmptyView基本构造
* `ZXEmptyView`的操作核心类为:`ZXEmptyContentView`
* `ZXEmptyContentView`中从上到下有四个基本控件:`zx_topImageView`，`zx_titleLabel`，`zx_detailLabel`，`zx_actionBtn`
* 开发者可以创建一个EmptyView继承于`ZXEmptyContentView`，并重写`zx_customSetting`方法，在其中修改`ZXEmptyContentView`中四个控件的值与样式
* 若需要把`ZXEmptyView`添加到self.view上，则调用`[self.view zx_setEmptyView:@"EmptyClass"]`进行初始化
* 在任何地方任何时间都可以通过`self.view.zx_emptyContentView`修改其内部控件的值与样式，修改后emptyContentView布局会自动刷新
### 基础初始化示例
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置EmptyView顶部的图片
    self.zx_topImageView.image = nil;
    //设置EmptyView中titleLabel的文字颜色
    self.zx_titleLabel.textColor = [UIColor lightGrayColor];
    //与正常设置view样式一样，详细的样式设计下方会列出...
}
@end
```
* 在需要显示EmptyView的控制器中
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置EmptyView
    [self.view zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedBlock:^(UIButton * _Nullable btn) {
        NSLog(@"点击了emptyView中的按钮");
    } emptyViewClickedBlock:^(UIView * _Nullable btn) {
        NSLog(@"点击了emptyView");
    }];
    //显示EmptyView
    [self.view zx_showEmptyView];
}
```
* 至此，一个EmptyView就已创建完毕，进入目标控制器即可发现EmptyView

### 自动显示或隐藏EmptyView(一行代码调用)
#### 此功能会自动根据tableView或collectionView的数据源来控制是否显示EmptyView，若存在header，将会自动向下偏移至适当高度

* 在含有tableView或collectionView的控制器的viewDidLoad中(注意这边的`DemoEmptyView`需要自己创建，继承于`ZXEmptyContentView`)
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView zx_setEmptyView:@"DemoEmptyView"];
}
```
或
```objective-c

[self.collectionView zx_setEmptyView:@"DemoEmptyView"];
```
即可

### 【建议】使用以下几行代码一次性设置整个项目的emptyView且自动管理，无需进行手动控制显示或隐藏等额外操作。
```objective-c
//在base控制器中，判断是否有tableView或collectionView，如果有就直接给它初始化空数据图，无需每个控制器都写一遍
- (void)viewDidLoad {
    [super viewDidLoad];
    if([self respondsToSelector:@selector(tableView)]){
        UITableView *tableView = [self valueForKey:@"tableView"];
        [tableView zx_setEmptyView:@"DemoEmptyView"];
    }
    if([self respondsToSelector:@selector(collectionView)]){
        UICollectionView *collectionView = [self valueForKey:@"collectionView"];
        [collectionView zx_setEmptyView:@"DemoEmptyView"];
    }
}
```
一劳永逸！以上代码使控制器中所有的属性名为`tableView`或`collectionView`的UITableView和UICollectionView有数据时自动隐藏空数据图，无数据时自动显示空数据图。


### 基础样式示例
### `ZXEmptyContentView`提供了丰富的样式自定义接口，您可以轻松快速地设置需要的EmptyView
#### 1.仅显示`titleLabel`
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置titleLabel
    self.zx_titleLabel.text = @"仅显示titleLabel";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
}
@end
```

#### 2.显示`titleLabel`和`detailLabel`
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置titleLabel
    self.zx_titleLabel.text = @"显示titleLabel和detailLabel";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    //设置detailLabel
    self.zx_detailLabel.text = @"这是detailLabel，超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试";
    self.zx_detailLabel.textColor = [UIColor darkGrayColor];
    self.zx_detailLabel.font = [UIFont systemFontOfSize:13];
}
@end
```

#### 3.显示`topImageView`、`titleLabel`和`detailLabel`
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置topImageView
    self.zx_topImageView.image = [UIImage imageNamed:@"nodata_icon"];
    self.zx_topImageView.zx_fixWidth = 100;
    
    //设置titleLabel
    self.zx_titleLabel.text = @"显示topImageView、titleLabel和detailLabel";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    //设置detailLabel
    self.zx_detailLabel.text = @"这是detailLabel，超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试";
    self.zx_detailLabel.textColor = [UIColor darkGrayColor];
    self.zx_detailLabel.font = [UIFont systemFontOfSize:13];
}
@end
```

#### 4.显示`topImageView`、`titleLabel`和`detailLabel`和`actionBtn`
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写zx_customSetting方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置topImageView
    self.zx_topImageView.image = [UIImage imageNamed:@"nodata_icon"];
    self.zx_topImageView.zx_fixWidth = 100;
    
    //设置titleLabel
    self.zx_titleLabel.text = @"显示topImageView、titleLabel、detailLabel和actionBtn";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    //设置detailLabel
    self.zx_detailLabel.text = @"这是detailLabel，超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试超长文字测试";
    self.zx_detailLabel.textColor = [UIColor darkGrayColor];
    self.zx_detailLabel.font = [UIFont systemFontOfSize:13];
    
    //设置actionBtn
    //设置actionBtn宽度比按钮文字内容宽度多15
    self.zx_actionBtn.zx_additionWidth = 15;
    //设置actionBtn高度比按钮文字内容高度多15
    self.zx_actionBtn.zx_additionHeight = 15;
    self.zx_actionBtn.layer.cornerRadius = 5;
    [self.zx_actionBtn setTitle:@"点击重试" forState:UIControlStateNormal];
    self.zx_actionBtn.backgroundColor = [UIColor orangeColor];
    [self.zx_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
```

#### 5.显示`titleLabel`和`actionBtn`
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置titleLabel
    self.zx_titleLabel.text = @"显示titleLabel和actionBtn";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    //设置actionBtn
    //设置actionBtn宽度比按钮文字内容宽度多15
    self.zx_actionBtn.zx_additionWidth = 15;
    //设置actionBtn高度比按钮文字内容高度多10
    self.zx_actionBtn.zx_additionHeight = 10;
    self.zx_actionBtn.layer.cornerRadius = 2;
    [self.zx_actionBtn setTitle:@"点击重试" forState:UIControlStateNormal];
    self.zx_actionBtn.backgroundColor = [UIColor orangeColor];
    [self.zx_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
```

#### 6.显示`topImageView`和`actionBtn`
* 创建DemoEmptyView，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置topImageView
    self.zx_topImageView.image = [UIImage imageNamed:@"nodata_icon"];
    self.zx_topImageView.zx_fixWidth = 100;

    //设置actionBtn
    //设置actionBtn宽度比按钮文字内容宽度多15
    self.zx_actionBtn.zx_additionWidth = 15;
    //设置actionBtn高度比按钮文字内容高度多10
    self.zx_actionBtn.zx_additionHeight = 10;
    self.zx_actionBtn.layer.cornerRadius = 2;
    [self.zx_actionBtn setTitle:@"点击重试" forState:UIControlStateNormal];
    self.zx_actionBtn.backgroundColor = [UIColor orangeColor];
    [self.zx_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
```
#### 7.其他情况可自行尝试，您只需要进行基本的数据和样式设置而无需设置frame，`ZXEmptyContentView`会帮助您自动布局
#### 在控制器中初始化之后，查看以上6种样式的显示效果:
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo1.jpg"/>

## 使用进阶
### `ZXEmptyContentView`布局修改
#### 获取`ZXEmptyContentView`对象
```objective-c
//若已经调用了初始化方法，如self.view zx_setEmptyView...，则ZXEmptyContentView将会添加在self.view上，使用下面的方式可以获取ZXEmptyContentView对象
ZXEmptyContentView *emptyContentView = self.view.zx_emptyContentView;
```

#### 修改`ZXEmptyContentView`自身布局
* `ZXEmptyContentView`大小会根据子控件的frame变化自动变化，且自动居中，您可以在此基础上进行自定义更改
* 设置Z`XEmptyContentView`距离顶部的固定高度（默认水平居中）
```objective-c
emptyContentView.zx_fixTop = 30;
```
* 设置`ZXEmptyContentView`距离左侧的固定距离（默认垂直居中）
```objective-c
emptyContentView.zx_fixLeft = 30;
```
* 设置`ZXEmptyContentView`的固定宽度（默认等于子控件中最宽的宽度，若超过EmptyContentView所属view的宽度-2*10，则为所属view的宽度-2*10）
```objective-c
//其子控件的宽度将被自动压缩，如内部label文字不够显示，则高度自动变高
emptyContentView.zx_fixWidth = 300;
```
* 修改`ZXEmptyContentView`的frame(当`ZXEmptyContentView` frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后ZXEmptyContentView的frame
    return orgFrame;
};
```
*** 
#### 修改`ZXEmptyContentView` 子控件布局
#### 修改`zx_topImageView`布局
* 修改zx_topImageView距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_topImageView.zx_fixTop = 20;
```
* 固定`zx_topImageView`的宽度，高度根据图片比例自适应(默认为image的宽度)
```objective-c
emptyContentView.zx_topImageView.zx_fixWidth = 100;
```
* 固定`zx_topImageView`的高度，宽度根据图片比例自适应(默认为image的高度)
```objective-c
emptyContentView.zx_topImageView.zx_fixHeight = 100;
```
* 固定`zx_topImageView`的size(默认为image的size)
```objective-c
emptyContentView.zx_topImageView.zx_fixSize = CGSizeMake(100,100);
```
* 修改`zx_topImageView`的frame(当zx_topImageView frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_topImageView的frame
    return orgFrame;
};
```
*** 
#### 修改`zx_titleLabel`布局
* 修改`zx_titleLabel`距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_titleLabel.zx_fixTop = 20;
```
* 固定`zx_titleLabel`的宽度，高度根据文字内容自适应(默认跟从ZXEmptyContentView自动调整)
```objective-c
emptyContentView.zx_titleLabel.zx_fixWidth = 100;
```
* 固定`zx_titleLabel`的高度，宽度根据文字内容自适应
```objective-c
emptyContentView.zx_titleLabel.zx_fixHeight = 30;
```
* 设置`zx_titleLabel`的附加宽度（在原始宽度[label文字宽度]上增加）
```objective-c
emptyContentView.zx_titleLabel.zx_additionWidth = 15;
```
* 设置`zx_titleLabel`的附加高度（在原始高度[label文字高度]上增加）
```objective-c
emptyContentView.zx_titleLabel.zx_additionHeight = 15;
```
* 修改`zx_titleLabel`的frame(当zx_titleLabel frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_titleLabel的frame
    return orgFrame;
};
```
*** 
#### 修改`zx_detailLabel`布局
* 同`zx_titleLabel`

*** 
#### 修改`zx_actionBtn`布局
* 修改`zx_actionBtn`距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_actionBtn.zx_fixTop = 20;
```
* 固定`zx_actionBtn`的宽度，高度根据文字内容自适应(默认跟从ZXEmptyContentView自动调整)
```objective-c
emptyContentView.zx_actionBtn.zx_fixWidth = 100;
```
* 固定`zx_actionBtn`的高度，宽度根据文字内容自适应
```objective-c
emptyContentView.zx_actionBtn.zx_fixHeight = 30;
```
* 设置`zx_actionBtn`的附加宽度（在原始宽度[按钮文字宽度]上增加）
```objective-c
emptyContentView.zx_actionBtn.zx_additionWidth = 15;
```
* 设置`zx_actionBtn`的附加高度（在原始高度[按钮文字高度]上增加）
```objective-c
emptyContentView.zx_actionBtn.zx_additionHeight = 15;
```
* 修改`zx_actionBtn`的frame(当zx_actionBtn frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_actionBtn的frame
    return orgFrame;
};
```
*** 
#### `ZXEmptyContentView` 子控件统一布局
* 设置`ZXEmptyContentView`的subviews距离底部的高度（默认为10）
```objective-c
emptyContentView.zx_subviewsMarginBottom = 20;
```
* 设置`ZXEmptyContentView`的subviews之间的间隙（默认为10）
```objective-c
emptyContentView.zx_defaultSubviewsSpace = 20;
```
*** 
### `ZXEmptyContentView`数据设置
#### `设置ZXEmptyContentView`的子控件数据
* `ZXEmptyContentView`的子控件包括`zx_topImageView`、`zx_titleLabel`、`zx_detailLabel`、`zx_actionBtn`
* 您可以在自定义EmptyView继承于`ZXEmptyContentView`并重写`zx_customSetting`方法的时候进行初始化设置
* 您也可以在控制器或其他地方通过view(`ZXEmptyContentView`添加到哪个view上，就用哪个view).zx_emptyContentView方式获取`ZXEmptyContentView`对象，从而获取内部控件，并随时修改
#### 下方是一个小Demo，实现了刚开始显示默认数据，3秒后更换数据的效果
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写zx_customSetting方法
- (void)zx_customSetting{
    //设置titleLabel
    self.zx_titleLabel.text = @"3秒后，emptyView数据将发生改变";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    //设置detailLabel
    self.zx_detailLabel.text = @"我是detailLabel";
    self.zx_detailLabel.textColor = [UIColor darkGrayColor];
    self.zx_detailLabel.font = [UIFont systemFontOfSize:13];
    
    //设置actionBtn
    //设置actionBtn宽度比按钮文字内容宽度多15
    self.zx_actionBtn.zx_additionWidth = 15;
    //设置actionBtn高度比按钮文字内容高度多10
    self.zx_actionBtn.zx_additionHeight = 10;
    self.zx_actionBtn.layer.cornerRadius = 2;
    [self.zx_actionBtn setTitle:@"我是actionBtn" forState:UIControlStateNormal];
    self.zx_actionBtn.backgroundColor = [UIColor orangeColor];
    [self.zx_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
```
* 在控制器中设置当前控制器view的emptyView为`DemoEmptyView`，并在3秒后修改emptyView子控件
```objective-c
[self.view zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedBlock:^(UIButton * _Nullable btn) {
    NSLog(@"点击了按钮");
} emptyViewClickedBlock:nil];
[self.view zx_showEmptyView];
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    self.view.zx_emptyContentView.zx_titleLabel.text = @"3秒到了";
    self.view.zx_emptyContentView.zx_titleLabel.layer.borderWidth = 1;
    self.view.zx_emptyContentView.zx_titleLabel.layer.borderColor = [UIColor redColor].CGColor;

    self.view.zx_emptyContentView.zx_detailLabel.text = @"数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变数据发生了改变";
    self.view.zx_emptyContentView.zx_actionBtn.backgroundColor = [UIColor purpleColor];
    [self.view.zx_emptyContentView.zx_actionBtn setTitle:@"我也发生了改变" forState:UIControlStateNormal];
});
```
* 查看效果:
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo1.gif"/>

***
### `ZXEmptyContentView` 点击回调
#### `ZXEmptyContentView`自身点击回调
* 在控制器中设置当前控制器view的emptyView为`DemoEmptyView`时，同时设置点击回调
```objective-c
[self.view zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedBlock:^(UIButton * _Nullable btn) {
    NSLog(@"点击了按钮");
} emptyViewClickedBlock:^(UIView * _Nullable btn) {
    NSLog(@"点击了emptyView");
}];
```
* 通过`ZXEmptyContentView`对象设置自身点击回调(Block)
```objective-c
self.view.zx_emptyContentView.zx_emptyViewClickedBlock = ^(UIView * _Nonnull sender) {
    NSLog(@"点击了emptyView");
};
```
* 通过`ZXEmptyContentView`对象设置自身点击回调(addTarget)
```objective-c
[self.view.zx_emptyContentView zx_emptyViewAddTarget:self action:@selector(emptyViewClickedAction)];
```
#### `ZXEmptyContentView`中的actionBtn点击回调(Block)
* 在控制器中设置当前控制器view的emptyView为`DemoEmptyView`时，同时设置点击回调
```objective-c
[self.view zx_setEmptyView:@"DemoEmptyView" isFull:NO clickedBlock:^(UIButton * _Nullable btn) {
    NSLog(@"点击了按钮");
} emptyViewClickedBlock:^(UIView * _Nullable btn) {
    NSLog(@"点击了emptyView");
}];
```
* 通过`ZXEmptyContentView`对象设置actionBtn点击回调(Block)
```objective-c
self.view.zx_emptyContentView.zx_btnClickedBlock = ^(UIView * _Nonnull sender) {
    NSLog(@"点击了按钮");
};
```
* 通过`ZXEmptyContentView`对象设置actionBtn点击回调(addTarget)
```objective-c
[self.view.zx_emptyContentView zx_btnAddTarget:self action:@selector(emptyViewClickedAction)];
```
* 通过actionBtn对象设置自身点击回调(Block)
```objective-c
[self.view.zx_emptyContentView.zx_actionBtn zx_clickedBlock:^(UIButton * _Nullable btn) {
    NSLog(@"点击了按钮");
}];
```
* 通过actionBtn对象设置自身点击回调(addTarget)
```objective-c
[self.view.zx_emptyContentView.zx_actionBtn zx_addTarget:self action:@selector(btnClickedAction)];
```
#### 点击自动隐藏`ZXEmptyContentView`
* 当点击了`ZXEmptyContentView`中的actionBtn时`ZXEmptyContentView`会自动隐藏，若实现了点击`ZXEmptyContentView`方法的监听，则点击`ZXEmptyContentView`时，`ZXEmptyContentView`也会自动隐藏
* 可以通过以下设置关闭此功能
```objective-c
self.tableView.zx_emptyContentView.zx_autoHideWhenTapOrClick = NO;
```
***

### `ZXEmptyContentView` UITableView&UICollectionView相关
#### `ZXEmptyContentView` 自动显示与隐藏
* 若将`ZXEmptyContentView`添加至tableView或collectionView中(如：`[self.tableView zx_setEmptyView...]`)，则`ZXEmptyContentView`会自动显示与隐藏
* 当tableView或collectionView有数据的时候，`ZXEmptyContentView`会自动隐藏，无数据时自动显示
* 可以通过以下设置关闭此功能
```objective-c
self.tableView.zx_emptyContentView.zx_autoShowEmptyView = NO;
```
#### `ZXEmptyContentView` 根据headerView和footerView的高度自动调整布局
* 当tableView或collectionView无数据并且有headerView或footerView时，`ZXEmptyContentView`会自动计算并调整y轴的偏移量，使得`ZXEmptyContentView`始终在二者之间
* 可以通过以下设置关闭此功能
```objective-c
self.tableView.zx_emptyContentView.zx_autoAdjustWhenHeaderView = NO;
self.tableView.zx_emptyContentView.zx_autoAdjustWhenFooterView = NO;
```
### `ZXEmptyContentView` 切换样式
#### 在实际开发中经常需要使用到样式切换，例如若tableView无数据，则显示无数据的emptyView，若网络请求失败，则显示网络错误的emptyView
#### 以下是一个样式切换的demo
* 创建`DemoEmptyView`，继承于`ZXEmptyContentView`，重写`zx_customSetting`方法，设置自定义的样式
```objective-c
@implementation DemoEmptyView
//重写父类zx_customSetting方法
- (void)zx_customSetting{
    self.zx_type = 0;
}

//重写父类属性zx_type的set方法，若zx_type=0，则为暂无数据，若zx_type=1，则为网络错误，通过控制zx_type来切换显示的样式
- (void)setZx_type:(int)zx_type{
    if(zx_type == 0){
        //暂无数据的样式
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
        //网络错误的样式
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
```
* 在tableView控制器中进行初始化设置
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    //此处只摘要EmptyView设置相关代码
    [self.tableView zx_setEmptyView:[DemoEmptyView class]];
    self.tableView.zx_emptyContentView.zx_btnClickedBlock = ^(UIButton * _Nonnull sender) {
        NSLog(@"点击了重新加载...");
        [self.netErrBtn setTitle:@"网络正常" forState:UIControlStateNormal];
        [self netErrorAction:self.netErrBtn];
    };
    
}
```
* 若网络加载失败
```objective-c
//emptyView样式为[网络错误]
self.tableView.zx_emptyContentView.zx_type = 1;
```
* 若网络加载成功
```objective-c
//emptyView样式为[暂无数据]
self.tableView.zx_emptyContentView.zx_type = 0;
```
* 无需关心何时显示或隐藏`ZXEmptyView`，`ZXEmptyView`会自动处理
#### 具体代码可查看Demo中的`DemoTableViewVC`

#### 效果预览
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo2.gif"/>

### `ZXEmptyContentView` UITableView & UICollectionView功能辅助
#### UITableView or UICollectionView开始加载的时候手动调用，将会隐藏emptyView
```objective-c
[self.tableView zx_startLoading];
```
#### 【非必须】UITableView or UICollectionView结束加载的时候手动调用，请求结束不调用亦可，ZXEmpty将监听UITableView or UICollectionView刷新并自动判定显示或隐藏emptyView
```objective-c
[self.tableView zx_endLoading];
```
***

### `ZXEmptyContentView`的其他设置
#### 手动显示`ZXEmptyContentView`
* 调用`ZXEmptyContentView`对象的`zx_show`方法
```objective-c
[emptyContentView zx_show];
```
* 调用`ZXEmptyContentView`所添加到的superView的`zx_showEmptyView`方法
```objective-c
[self.tableView zx_showEmptyView];
```
#### 手动隐藏`ZXEmptyContentView`
* 调用`ZXEmptyContentView`对象的`zx_hide`方法
```objective-c
[emptyContentView zx_hide];
```
* 调用`ZXEmptyContentView`所添加到的superView的`zx_showEmptyView`方法
```objective-c
[self.tableView zx_hideEmptyView];
```

#### 设置`ZXEmptyContentView`覆盖满整个superView
```objective-c
//isFull为YES，则覆盖满整个superView
[self.view zx_setEmptyView:@"DemoEmptyView" isFull:YES clickedBlock:^(UIButton * _Nullable btn) {
    NSLog(@"点击了按钮");
} emptyViewClickedBlock:^(UIView * _Nullable btn) {
    NSLog(@"点击了emptyView");
}];
```
#### 获取`ZXEmptyContentView`的`zx_fullEmptyView`(覆盖满整个superView的view)
* 通过ZXEmptyContentView对象的获取
```objective-c
ZXFullEmptyView *fullEmptyViewem = emptyContentView.zx_fullEmptyView;
```
* 通过ZXEmptyContentView所添加到的主视图获取
```objective-c
ZXFullEmptyView *fullEmptyViewem = self.view.zx_fullEmptyView;
```
#### 事实上，当`ZXEmptyContentView`为覆盖满整个目标view的时候，`ZXEmptyContentView`的superView为目标view；
#### 当`ZXEmptyContentView`需要覆盖满目标视图的时候，`ZXEmptyContentView`的superView是`ZXFullEmptyView`，`ZXFullEmptyView`的superView是目标view

***
### 完全自定义`ZXEmptyView`
#### 若`ZXEmptyContentView`中的子控件数量或种类无法满足需求，可以完全自定义，且仍然可以使用自动居中布局与自动显示
* 在控制器中
```objective-c
DemoCustomEmptyView *customEmptyView = [[[NSBundle mainBundle]loadNibNamed:@"DemoCustomEmptyView" owner:nil options:nil]lastObject];
customEmptyView.backgroundColor = [UIColor yellowColor];
customEmptyView.zx_size = CGSizeMake(300, 200);
[self.view zx_setCustomEmptyView:customEmptyView];
[self.view zx_showEmptyView];
```
#### 具体代码可查看Demo中的`DemoCustomViewVC`
#### 效果预览
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo2.jpg"/>







