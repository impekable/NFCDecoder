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

public enum NdefPayload {
    
    /// No payload
    case empty
    
    /// Textual data
    case text(Text)
    
    /// Absolute URI
    case uri(Uri)
    
    /// Smart poster (see NFC Forum Smart Poster Record Type Definition)
    case smartPoster([NdefPayload])
    
    /// MIME-encoded media (see RFC 2046)
    case media(Data)
    
    /// External type data (see NFC Forum NFC Record Type Definition)
    case external(Data)
    
    /// Unknown data
    case unknown(Data)
    
}

