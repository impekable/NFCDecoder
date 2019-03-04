//
//  NdefPayload.Uri.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. MIT License.
//

import Foundation

extension NdefPayload {
    
    /**
     URI NDEF payload
     */
    
    public struct Uri: CustomStringConvertible {
        
        private let payload: Data
        
        public init(_ record: NdefRecord) {
            precondition(record.isUriRecord)
            self.payload = record.payload
        }
        
        /* Based on "URI Record Type Definition - Technical Specification" */
        
        /// Actual URL
        public var url: URL { return URL(string: uriPrefix.string + restOfTheUri)! }
        
        private var uriPrefix: Prefix { return Prefix(rawValue: payload[0])! }
        
        private var restOfTheUri: String { return String(data: payload[1...], encoding: .utf8)! }
        
        public var description: String { return url.absoluteString }
                
    }
    
}


