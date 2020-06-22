Pod::Spec.new do |spec| 
  spec.name         = 'MLinView' #库名字
  spec.version      = '1.0.0' #版本号
  spec.license      = { :type => 'Apache License' } #许可协议
  spec.homepage     = 'https://github.com/chen397254698/MLinView' #主页
  spec.authors      = { 'chen397254698' => '397254698@qq.com' } #作者
  spec.summary      = 'a simple trunk layout, let you easy to create layout' #简介
  spec.source       = { :git => "https://github.com/chen397254698/MLinView.git", :tag => '1.0.0' } #仓库地址
  spec.source_files = 'MLinView', 'MLinView/*.{h,m}' #参与编译的文件
  spec.framework    = 'Masonry' #依赖的系统库（指苹果的系统库）
end