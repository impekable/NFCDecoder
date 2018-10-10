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
    
}


