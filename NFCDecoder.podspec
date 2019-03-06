#
# Be sure to run `pod lib lint NFCDecoder.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  
  s.name             = 'NFCDecoder'
  s.version          = '1.0.0'
  s.summary          = 'Decodes NFCNDEFMessage or NFCNDEFPayload into String, URL or smart poster.'
  
  s.description      = <<-DESC
    Apple did a great job introducing CoreNFC in iOS 11.
    NFCDecoder adds the final piece to the puzzle - it gets actual Strings and URLs from that NFCNDEFPayload or NFCNDEFMessage.
    All widely used payload types are supported (text, URI and smart poster). NFCDecoder is free, lightweight and written in Swift.
    Try the example!
  DESC
  
  s.homepage         = 'https://github.com/impekable/NFCDecoder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'Impekable LLC' => 'pek@impekable.com', 'Alexander Vasenin' => 'alexv@impekable.com' }
  s.source           = { :git => 'https://github.com/impekable/NFCDecoder.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '11.0'
  s.swift_version    = '4.2'
  s.frameworks       = 'CoreNFC'
  
  s.source_files     = 'NFCDecoder/Classes/**/*'
  
end


