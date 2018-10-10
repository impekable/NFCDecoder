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
        
        /// Indicates structure of type field
        public var typeNameFormat: NFCTypeNameFormat { return NFCTypeNameFormat(rawValue: rawValue & 0x07)! }
        
        /// Flag indicating presence of identificator length (and identificator itself)
        public static let hasIdLength = Header(rawValue: 1 << 3)
        
        /// If set, payload length is 1 byte long (otherwise 4 bytes long)
        public static let isShortRecord = Header(rawValue: 1 << 4)
        
        /// Flag indicating chunked record (not supported by NfcDecoder)
        public static let isChunked = Header(rawValue: 1 << 5)
        
        /// Flag indicating start of NDEF message
        public static let isMessageBegin = Header(rawValue: 1 << 6)
        
        /// Flag indicating end of NDEF message
        public static let isMessageEnd = Header(rawValue: 1 << 7)
        
        // FIXME: description + TNF description
        
    }
    
}


