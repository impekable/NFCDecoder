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
 An NFC NDEF record with payload, TNF/type pair and optional identifier.
 Actually, common denominator between (confusingly named) NFCNDEFPayload and RawNdefRecord.
 */

public protocol NdefRecord: CustomStringConvertible {
    
    /// The Type Name Format (aka TNF, as defined by the NDEF specification)
    var typeNameFormat: NFCTypeNameFormat { get }
    
    /// Payload type (as defined by the NDEF specification)
    var type: Data { get }
    
    /// NDEF message identifier
    var identifier: Data { get }
    
    /// Actual payload data
    var payload: Data { get }
    
}

extension NdefRecord {
    
    /// True if instance is a text record
    var isTextRecord: Bool { return typeNameFormat == .nfcWellKnown && type == Data([0x54]) }
    
    /// True if instance is an URI record
    var isUriRecord: Bool { return typeNameFormat == .nfcWellKnown && type == Data([0x55]) }
    
    /// True if instance is a smart poster record
    var isSmartPosterRecord: Bool { return typeNameFormat == .nfcWellKnown && type == Data([0x53, 0x70]) }
    
}

extension RawNdefRecord: NdefRecord {
    
    public var type: Data { return payloadType }
    public var typeNameFormat: NFCTypeNameFormat { return header.typeNameFormat }
    public var identifier: Data { return messageId }
    
}

extension NFCNDEFPayload: NdefRecord { }


