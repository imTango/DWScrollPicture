Pod::Spec.new do |s|
  s.name         = "DWScrollPictures"
  s.version      = "0.0.1"
  s.summary      = "A simple new features and shuffling figure of lightweight framework ."
  s.description      = <<-DESC
                       It is a marquee view used on iOS, A simple new features and shuffling figure of lightweight framewor.
                       DESC
  s.license      = "MIT"
  s.author             = { "dwang.hello" => "dwang.hello@outlook.com" }
  s.source       = { :git => "https://github.com/dwanghello/DWScrollPicture.git", :tag => s.version.to_s }
   s.platform     = :ios, '8.0'
  s.source_files  = "DWScrollPictures/*"
  s.frameworks = 'UIKit', 'Foundation'
end
