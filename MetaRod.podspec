#
#  Be sure to run `pod spec lint MetaRod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "MetaRod"
  spec.version      = "1.0.0"
  spec.summary      = "lightweight url meta data parser library"
  spec.homepage     = "https://github.com/misyobun/MetaRod"
  spec.screenshots  = "https://user-images.githubusercontent.com/509448/72453120-f123cf00-3801-11ea-8947-a1540f91b27e.gif"
  spec.license      = "MIT"
  spec.author    	= "misyobun"
  spec.social_media_url   = "https://twitter.com/misyobun"
  spec.platform     = :ios
  spec.requires_arc = true
  spec.swift_versions = ['5.0']
  spec.source           = { :git => "https://github.com/misyobun/MetaRod.git", :tag => spec.version.to_s }
  spec.source_files  = "MetaRod/Sources/**/*"
  spec.ios.deployment_target = '13.0'
  spec.dependency "SwiftSoup"
end
