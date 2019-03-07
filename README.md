# NFCDecoder

[![Version](https://img.shields.io/cocoapods/v/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![License](https://img.shields.io/cocoapods/l/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)
[![Platform](https://img.shields.io/cocoapods/p/NFCDecoder.svg?style=flat)](https://cocoapods.org/pods/NFCDecoder)

Apple did a great job introducing `CoreNFC` in iOS 11. `NFCDecoder` adds the final piece to the puzzle - it gets actual Strings and URLs from that `NFCNDEFPayload` or `NFCNDEFMessage`. All widely used payload types are supported (text, URI and smart poster). `NFCDecoder` is free, lightweight and written in Swift. Try the example!

## Installation

### Cocoapods

NFCDecoder is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NFCDecoder'
```

### Carthage

NFCDecoder is compatible with [Carthage](https://github.com/Carthage/Carthage). Add it to your `Cartfile`:

```ruby
github "impekable/NFCDecoder"
```

## Usage

Add to your `NFCReaderSessionDelegate`:

```swift
    import NFCDecoder
    
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

## Author

[Impekable](https://www.impekable.com) is a UI design and mobile development studio based in San Jose, CA. We help organizations from startups to Fortune 500 companies create memorable, human-centric mobile experiences.

## License

`NFCDecoder` is available under the MIT license. See the LICENSE file for more info.


