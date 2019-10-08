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
### 示例
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
