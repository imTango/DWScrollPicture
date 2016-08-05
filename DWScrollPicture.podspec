Pod::Spec.new do |s|
  s.name         = "DWScrollPicture"
  s.version      = "0.0.1"
  s.summary      = "Simplify the writing of the new features and shuffling figure."
  s.homepage     = "https://github.com/dwanghello/DWScrollPicture"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "dwanghello" => "dwang.hello@outlook.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/dwanghello/DWScrollPicture.git", :tag => s.version.to_s }
  s.source_files  =  "DWScrollPicture/*"
  s.frameworks = "UIKit", "Foundation"
end
