Pod::Spec.new do |s|

s.name        = "MLinView"

s.version      = "1.0.0"

s.summary      = "a simple trunk layout, let you easy to create layout"

s.homepage    = "https://github.com/chen397254698/MLinView"

s.license      = "Apache License 2.0"

s.author      = { "chen397254698" => "397254698@qq.com" }

s.platform    = :ios, "9.0"

s.source      = { :git => "https://github.com/chen397254698/MLinView.git", :tag => s.version }

s.source_files  = "MLinView", "MLinView/*.{h,m}"

s.framework  = "UIKit"

s.requires_arc = true

s.dependency 'SnapKit'

