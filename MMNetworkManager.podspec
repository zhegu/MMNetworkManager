#
#  Be sure to run `pod spec lint MMNetworkManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "MMNetworkManager"
  s.version      = "1.0.0"
  s.summary      = "MMNetworkManager is our Network Manager"

  #s.description  = <<-DESC DESC
  s.homepage      = "https://github.com/zhegu/MMNetworkManager"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # s.license      = "MIT (example)"
   s.license      = { :type => "MIT", :file => "LICENSE" }


 
  s.author             = { "LiZhe" => "lizhe707@163.com" }
 
  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/zhegu/MMNetworkManager.git", :tag => "#{s.version}" }


  s.source_files  = "MMNetworkManager/"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.dependency "Moya", "10.0.1"
  s.dependency 'Moya/RxSwift', '10.0.1'
  s.dependency 'MMTools'
  s.dependency 'ObjectMapper', '3.1.0'

  s.frameworks  = "Foundation","UIKit"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  s.swift_version = '4.0'


end
