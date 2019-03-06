#
# Be sure to run `pod lib lint NFCDecoder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NFCDecoder'
  s.version          = '0.1.0'
  s.summary          = 'Decodes NFCNDEFMessage or NFCNDEFPayload into String, URL or smart poster.'

  s.description      = <<-DESC
    Apple did a great job introducing CoreNFC in iOS 11. However, one critical piece is surpisingly missing even in iOS 12 - getting actual application level data from that NFCNDEFPayload.
    NFCDecoder purpose is to get vanilla String or URL from low level NFC tag payload. It supports all widely used payload types: text, URI and smart poster.
    It's lightweight, written in Swift and has tests. Try the example!
  DESC

  s.homepage         = 'https://github.com/alex.vasenin/NFCDecoder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexander Vasenin' => 'alexv@impekable.com' }
  s.source           = { :git => 'https://github.com/alex.vasenin/NFCDecoder.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'NFCDecoder/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NFCDecoder' => ['NFCDecoder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
