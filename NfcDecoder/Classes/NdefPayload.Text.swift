//
//  NdefPayload.Text.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation

extension NdefPayload {
    
    /**
     Textual NDEF payload
     */
    
    public struct Text: CustomStringConvertible {
        
        private let payload: Data
        
        public init(_ record: NdefRecord) {
            precondition(record.isTextRecord)
            self.payload = record.payload
        }
        
        // Based on "Text Record Type Definition - Technical Specification"
        
        private var status: UInt8 { return payload[0] }
        private var encoding: String.Encoding { return (status & (1 << 7)) > 0 ? .utf16BigEndian : .utf8 }
        
        private var languageCodeOffset: Int { return 1 }
        private var languageCodeLength: Int { return Int(status & 0x3F) }
        private var languageCodeData: Data { return payload[languageCodeOffset ..< languageCodeOffset+languageCodeLength] }
        
        /// Language code (RFC 3066)
        public var languageCode: String { return String(data: languageCodeData, encoding: .ascii)! }
        
        private var textDataOffset: Int { return languageCodeOffset + languageCodeLength }
        private var textDataLength: Int { return payload.count - languageCodeLength - 1 }
        private var textData: Data { return payload[textDataOffset ..< textDataOffset+textDataLength] }
        
        /// Actual text
        public var text: String { return String(data: textData, encoding: encoding)! }
        
        public var description: String { return text }
        
    }
    
}


