Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "ListsKit"
s.summary = "ListsKit the easy way to work with TableView."
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Blinov Danil" => "blinovdev@gmail.com" }
s.homepage = "https://github.com/blinover/ListsKit"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/blinover/ListsKit.git", 
             :tag => "#{s.version}" }
s.framework = "UIKit"
s.dependency 'RxSwift', '~> 5.1.1'
s.dependency 'RxCocoa', '~> 5.1.1'

# 8
s.source_files = "ListsKit/**/*.{swift}"

# 9
s.resources = "ListsKit/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.0"

end