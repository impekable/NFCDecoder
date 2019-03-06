# NFCDecoder

[![Version](https://img.shields.io/cocoapods/v/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![License](https://img.shields.io/cocoapods/l/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![Platform](https://img.shields.io/cocoapods/p/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)

Apple did a great job introducing `CoreNFC` in iOS 11. However, one critical piece is still missing (even in iOS 12) - getting application data from that `NFCNDEFPayload` or `NFCNDEFMessage`. NFCDecoder purpose is to get vanilla String or URL from low level NFC tag payload. It supports all widely used payload types: text, URI and smart poster. It's lightweight, written in Swift and has tests. Try the example!

## Usage

Add to your Podfile:

```ruby
pod 'NFCDecoder'
```

Run `pod install`. Then add to your `NFCReaderSessionDelegate`:

```swift
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        let payloads = NFCDecoder().decode(messages)
        payloads.forEach { logToConsole(payload: $0) }
        stopNfcSession()
    }
    
    func logToConsole(payload: NdefPayload) {
        switch payload {
        case .text(let text):
            print(text.text, text.languageCode)
        case .uri(let uri):
            print(uri.url.absoluteString)
        case .smartPoster(let morePayloads): // Smart poster is just a container for more payloads
            morePayloads.forEach { logToConsole(payload: $0) }
        case .empty:
            print("empty payload")
        case .unknown(_):
            print("oops")
        }
    }
```

Full example project is available in Example directory.

## Requirements

iOS 11+, iPhone 7 or newer.

## Authors

- Impekable LLC, www.impekable.com
- Alexander Vasenin, alexv@impekable.com

## License

NFCDecoder is available under the MIT license. See the LICENSE file for more info.


