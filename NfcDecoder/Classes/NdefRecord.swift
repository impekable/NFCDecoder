//
//  NdefRecord.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation
import CoreNFC

/**
 NFC NDEF record which contains payload described by type, length and optional identifier
 Note: In CoreNFC NDEF record is represented by confusingly named NFCNDEFPayload. Unfortunately we can't just extend NFCNDEFPayload since in has no public initializers (we need for smart posters support).
 */

public struct NdefRecord: CustomStringConvertible {
    
    var data: Data
    
    public init(_ data: Data) { self.data = data }
    
    public init(_ record: NFCNDEFPayload) { self.data = record.payload }
    
    public var description: String { return "NdefRecord <\(data.hexEncodedString(separator: " ", every: 4))>" }
    
}


