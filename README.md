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
* ZXEmptyView的操作核心类为:ZXEmptyContentView
* ZXEmptyContentView中从上到下有四个基本控件:zx_topImageView，zx_titleLabel，zx_detailLabel，zx_actionBtn
* 开发者可以创建一个EmptyView继承于ZXEmptyContentView，并重写zx_customSetting，在其中修改ZXEmptyContentView中四个控件的值与样式
* 若需要把ZXEmptyView添加到self.view上，则调用[self.view zx_setEmptyView:@"EmptyClass"]进行初始化
* 在任何地方任何时间都可以通过self.view.zx_emptyContentView修改其内部控件的值与样式，修改后emptyContentView布局会自动刷新
### 基础初始化示例
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

## 基础样式示例
### ZXEmptyContentView提供了丰富的样式自定义接口，您可以轻松快速地设置需要的EmptyView
#### 1.仅显示titleLabel
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

#### 2.显示titleLabel和detailLabel
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

#### 3.显示topImageView、titleLabel和detailLabel
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

#### 4.显示topImageView、titleLabel和detailLabel和actionBtn
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

#### 5.显示titleLabel和actionBtn
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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

#### 6.显示topImageView和actionBtn
* 创建DemoEmptyView，继承于ZXEmptyContentView，重写zx_customSetting，设置自定义的样式
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
#### 7.其他情况可自行尝试，您只需要进行基本的数据和样式设置而无需设置frame，ZXEmptyContentView会帮助您自动布局
#### 在控制器中初始化之后，查看效果:
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo1.jpg"/>

## 使用进阶
### ZXEmptyContentView布局修改
#### 获取ZXEmptyContentView对象
```objective-c
//若已经调用了初始化方法，如self.view zx_setEmptyView...，则ZXEmptyContentView将会添加在self.view上，使用下面的方式可以获取ZXEmptyContentView对象
ZXEmptyContentView *emptyContentView = self.view.zx_emptyContentView;
```

#### 修改ZXEmptyContentView自身布局
* ZXEmptyContentView大小会根据子控件的frame变化自动变化，且自动居中，您可以在此基础上进行自定义更改
* 设置ZXEmptyContentView距离顶部的固定高度（默认水平居中）
```objective-c
emptyContentView.zx_fixTop = 30;
```
* 设置ZXEmptyContentView距离左侧的固定距离（默认垂直居中）
```objective-c
emptyContentView.zx_fixLeft = 30;
```
* 设置ZXEmptyContentView的固定宽度（默认等于子控件中最宽的宽度，若超过EmptyContentView所属view的宽度-2*10，则为所属view的宽度-2*10）
```objective-c
//其子控件的宽度将被自动压缩，如内部label文字不够显示，则高度自动变高
emptyContentView.zx_fixWidth = 300;
```
* 修改ZXEmptyContentView的frame(当ZXEmptyContentView frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后ZXEmptyContentView的frame
    return orgFrame;
};
```
#### 修改ZXEmptyContentView 子控件布局
#### 修改zx_topImageView布局
* 修改zx_topImageView距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_topImageView.zx_fixTop = 20;
```
* 固定zx_topImageView的宽度，高度根据图片比例自适应(默认为image的宽度)
```objective-c
emptyContentView.zx_topImageView.zx_fixWidth = 100;
```
* 固定zx_topImageView的高度，宽度根据图片比例自适应(默认为image的高度)
```objective-c
emptyContentView.zx_topImageView.zx_fixHeight = 100;
```
* 固定zx_topImageView的size(默认为image的size)
```objective-c
emptyContentView.zx_topImageView.zx_fixSize = CGSizeMake(100,100);
```
* 修改zx_topImageView的frame(当zx_topImageView frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_topImageView的frame
    return orgFrame;
};
```
*** 
#### 修改zx_titleLabel布局
* 修改zx_titleLabel距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_titleLabel.zx_fixTop = 20;
```
* 固定zx_titleLabel的宽度，高度根据文字内容自适应(默认跟从ZXEmptyContentView自动调整)
```objective-c
emptyContentView.zx_titleLabel.zx_fixWidth = 100;
```
* 修改zx_titleLabel的frame(当zx_titleLabel frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_titleLabel的frame
    return orgFrame;
};
```
#### 修改zx_detailLabel布局
* 同zx_titleLabel

#### 修改zx_actionBtn布局
* 修改zx_actionBtn距离顶部高度(默认为10)
```objective-c
emptyContentView.zx_actionBtn.zx_fixTop = 20;
```
* 固定zx_actionBtn的宽度，高度根据文字内容自适应(默认跟从ZXEmptyContentView自动调整)
```objective-c
emptyContentView.zx_actionBtn.zx_fixWidth = 100;
```
* 固定zx_actionBtn的高度，宽度根据文字内容自适应
```objective-c
emptyContentView.zx_actionBtn.zx_fixHeight = 30;
```
* 固定zx_actionBtn的附加宽度（在原始宽度[按钮文字宽度]上增加）
```objective-c
emptyContentView.zx_actionBtn.zx_additionWidth = 15;
```
* 固定zx_actionBtn的附加高度（在原始高度[按钮文字高度]上增加）
```objective-c
emptyContentView.zx_actionBtn.zx_additionHeight = 15;
```
* 修改zx_actionBtn的frame(当zx_actionBtn frame改变时会自动调用此block)
```objective-c
self.zx_handleFrame = ^CGRect(CGRect orgFrame) {
    //将orgFrame修改后返回，orgFrame为自动布局之后zx_actionBtn的frame
    return orgFrame;
};
```
#### ZXEmptyContentView 子控件统一布局
* 设置ZXEmptyContentView的subviews距离底部的高度（默认为10）
```objective-c
emptyContentView.zx_subviewsMarginBottom = 20;
```
* 设置ZXEmptyContentView的subviews之间的间隙（默认为10）
```objective-c
emptyContentView.zx_defaultSubviewsSpace = 20;
```
# TODO






