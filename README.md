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
#### 在控制器中初始化之后，查看效果:
<img src="http://www.zxlee.cn/ZXEmptyViewDemoImg/demo1.jpg"/>

### ZXEmptyContentView布局
#### TODO
