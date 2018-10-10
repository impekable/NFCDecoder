//
//  NdefRecord.Header.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation
import CoreNFC

extension NdefRecord {
    
    /**
     First byte of NDEF record.
     Contains Type Name Format (first three bits) and various flags (id length presence, short record, chunked record, message begin and end).
     See NFC Data Exchange Format specification for more info.
     */
    
    public struct Header: OptionSet {
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        public var typeNameFormat: NFCTypeNameFormat { return NFCTypeNameFormat(rawValue: rawValue & 0x07)! }
        
        public static let hasIdLength = Header(rawValue: 1 << 3)
        public static let isShortRecord = Header(rawValue: 1 << 4)
        public static let isChunked = Header(rawValue: 1 << 5)
        public static let isMessageBegin = Header(rawValue: 1 << 6)
        public static let isMessageEnd = Header(rawValue: 1 << 7)
        
        // FIXME: description + TNF description
        
    }
    
}


