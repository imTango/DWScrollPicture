Pod::Spec.new do |s|
  s.name             = "DWScrollPictures"
  s.version          = "0.0.4"
  s.summary          = "A simple new features and shuffling figure of lightweight framework."
  s.description      = <<-DESC
                       t is a marquee view used on iOS, A simple new features and shuffling figure of lightweight framewor.
                       DESC
  s.homepage         = "https://github.com/dwanghello/DWScrollPicture"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "dwanghello" => "dwang.hello@outlook.com" }
  s.source           = { :git => "https://github.com/dwanghello/DWScrollPicture.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '8.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  #s.requires_arc = true

  s.source_files = 'DWScrollPictures/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
  s.xcconfig = {'HEADER_SEARCH_PATHS' =>'$(SDKROOT)/usr/include/libxml2'}

end