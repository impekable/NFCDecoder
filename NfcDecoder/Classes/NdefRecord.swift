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
    
    /// Raw data of NDEF record
    public var data: Data
    
    /// Creates NdefRecord from raw Data
    public init(_ data: Data) { self.data = data }
    
    /// Creates NdefRecord from NFCNDEFPayload
    public init(_ record: NFCNDEFPayload) { self.data = record.payload }
    
    /// First byte with TNF and various flags
    public var header: Header { return Header(rawValue: data[0]) }
    
    public var description: String { return "NdefRecord <\(data.hexEncodedString(separator: " ", every: 4))>" }
    
}


