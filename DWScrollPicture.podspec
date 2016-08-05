Pod::Spec.new do |s|
  s.name         = "DWScrollPicture"
  s.version      = "0.0.1"
  s.summary      = "A short description of DWScrollPicture."
  # s.description  = <<-DESC
  #                 DESC

  s.homepage     = "https://github.com/dwanghello/DWScrollPicture"

  s.license      = "MIT"
 
  s.author             = { "dwanghello" => "dwang.hello@outlook.com" }
  
  # s.platform     = :ios
  s.platform     = :ios, "8.0"

 
  s.source       = { :git => "https://github.com/dwanghello/DWScrollPicture.git", :tag => s.version.to_s }


  s.source_files  =  "DWScrollPicture/DWScrollPicture/DWScrollPicture/*"
 
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "UIKit"
  # s.frameworks = "UIKit", "Foundation"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = false

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
