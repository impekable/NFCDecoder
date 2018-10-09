//
//  NdefPayload.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation

/**
 NDEF payload (application data carried within an NDEF record)
 */

public enum NdefPayload: CustomStringConvertible {
    
    /// No payload
    case empty
    
    /// Textual data
    case text(Text)
    
    /// Absolute URI
    case uri(Uri)
    
    /// Smart poster (see NFC Forum Smart Poster Record Type Definition)
    case smartPoster([NdefPayload])
    
    /// Unknown data
    case unknown(Data)
    
    public var description: String {
        switch self {
        case .empty:
            return "Empty Payload"
        case .text(let text):
            return text.description
        case .uri(let uri):
            return uri.description
        case .smartPoster(let contents):
            return "Smart Poster " + contents.description
        case .unknown(let data):
            return "Unknown Payload (\(data.count) bytes)"
        }
    }
    
}


