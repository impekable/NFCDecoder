# NFCDecoder

[![Version](https://img.shields.io/cocoapods/v/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![License](https://img.shields.io/cocoapods/l/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![Platform](https://img.shields.io/cocoapods/p/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)

Apple did a great job introducing CoreNFC in iOS 11. However, one critical piece is still missing even in iOS 12 - getting actual application level data from that NFCNDEFPayload. NFCDecoder purpose is to get vanilla String or URL from low level NFC tag payload. It supports all widely used payload types: text, URI and smart poster. It's lightweight, written in Swift and has tests. Try the example!

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 11+, iPhone 7 or newer

## Installation

NFCDecoder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NFCDecoder'
```

## Author

Impekable LLC, www.impekable.com
Alexander Vasenin, alexv@impekable.com

## License

NFCDecoder is available under the MIT license. See the LICENSE file for more info.


