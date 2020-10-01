Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "ListsKit"
s.summary = "ListsKit the easy way to work with TableView."
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Blinov Danil" => "blinovdev@gmail.com" }
s.homepage = "https://github.com/blinover/ListsKit"
s.source = { :git => "https://github.com/blinover/ListsKit.git",
             :tag => "#{s.version}" }
s.framework = "UIKit"
s.dependency 'RxSwift', '~> 5.1.1'
s.dependency 'RxCocoa', '~> 5.1.1'
s.source_files = "Sources/ListsKit/**/*.{swift}"
s.swift_version = "5.0"

end
