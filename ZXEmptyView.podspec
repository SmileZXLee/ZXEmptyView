Pod::Spec.new do |s|
s.name         = 'ZXEmptyView'
s.version      = '1.0.9'
s.summary      = '轻松构建无数据、网络错误等占位图，简单易用'
s.homepage     = 'https://github.com/SmileZXLee/ZXEmptyView'
s.license      = 'MIT'
s.authors      = {'李兆祥' => '393727164@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/SmileZXLee/ZXEmptyView.git', :tag => s.version}
s.source_files = 'ZXEmptyViewDemo/ZXEmptyViewDemo/ZXEmptyView/**/*'
s.requires_arc = true
end