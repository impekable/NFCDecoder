//
//  NfcDecoderTests.swift
//  NfcDecoder_Tests
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import XCTest
import CoreNFC
@testable import NfcDecoder

class NfcDecoderTests: XCTestCase {
    
    func testDecodeWellKnownText() {
        let record = NdefRecordMockup(typeNameFormat: .nfcWellKnown, type: Data([0x54]), payload: Data([0x02, 0x65, 0x6e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21]))
        let payload = NfcDecoder().decode(record)
        switch payload {
        case .text(let text):
            XCTAssertEqual(text.languageCode, "en")
            XCTAssertEqual(text.text, "Hello, world!")
        default:
            XCTFail()
        }
    }
    
    func testDecodeWellKnownUri1() {
        let record = NdefRecordMockup(typeNameFormat: .nfcWellKnown, type: Data([0x55]), payload: Data([0x04, 0x30, 0x74, 0x2e, 0x67, 0x73, 0x2f, 0x52, 0x54, 0x6e, 0x4c, 0x4a, 0x61]))
        let payload = NfcDecoder().decode(record)
        switch payload {
        case .uri(let uri):
            XCTAssertEqual(uri.url.absoluteString, "https://0t.gs/RTnLJa")
        default:
            XCTFail()
        }
    }
    
    func testDecodeWellKnownUri2() {
        let record = NdefRecordMockup(typeNameFormat: .nfcWellKnown, type: Data([0x55]), payload: Data([0x04, 0x30, 0x74, 0x2e, 0x67, 0x73, 0x2f, 0x4d, 0x4d, 0x78, 0x58, 0x57, 0x4a]))
        let payload = NfcDecoder().decode(record)
        switch payload {
        case .uri(let uri):
            XCTAssertEqual(uri.url.absoluteString, "https://0t.gs/MMxXWJ")
        default:
            XCTFail()
        }
    }
    
    func testPhoneNumber() {
        let rawData = Data([0xD1, 0x01, 0x0D, 0x55, 0x05, 0x2b, 0x33, 0x35, 0x38, 0x39, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37])
        let record = RawNdefRecord(rawData)
        let payload = NfcDecoder().decode(record)
        switch payload {
        case .uri(let uri):
            XCTAssertEqual(uri.url.absoluteString, "tel:+35891234567")
        default:
            XCTFail()
        }
    }
    
    func testSmartPoster1() {
        let data = Data([0x91, 0x01, 0x1f, 0x55, 0x04, 0x69, 0x6d, 0x70, 0x65, 0x6b, 0x61, 0x62, 0x6c, 0x65, 0x2e, 0x63, 0x6f, 0x6d, 0x3f, 0x6d, 0x3d, 0x30, 0x34, 0x30, 0x45, 0x41, 0x31, 0x31, 0x41, 0x38, 0x30, 0x34, 0x39, 0x38, 0x30, 0x51, 0x01, 0x0c, 0x54, 0x02, 0x72, 0x75, 0x49, 0x6d, 0x70, 0x65, 0x6b, 0x61, 0x62, 0x6c, 0x65])
        let record = NdefRecordMockup(typeNameFormat: .nfcWellKnown, type: Data([0x53, 0x70]), payload: data)
        let payload = NfcDecoder().decode(record)
        switch payload {
        case .smartPoster(let subpayloads):
            XCTAssertEqual(subpayloads.count, 2)
            switch (subpayloads[0], subpayloads[1]) {
            case (.uri(let uri), .text(let text)):
                XCTAssertEqual(text.languageCode, "ru")
                XCTAssertEqual(text.text, "Impekable")
                XCTAssertEqual(uri.url.absoluteString, "https://impekable.com?m=040EA11A804980")
            default:
                XCTFail()
            }
        default:
            XCTFail()
        }
    }
    
}


