//
//  NdefRecord+Types.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation

extension NdefRecord {
    
    /// True if instance is a text record
    var isTextRecord: Bool { return header.typeNameFormat == .nfcWellKnown && payloadType == Data([0x54]) }
    
    /// True if instance is an URI record
    var isUriRecord: Bool { return header.typeNameFormat == .nfcWellKnown && payloadType == Data([0x55]) }
    
    /// True if instance is a smart poster record
    var isSmartPosterRecord: Bool { return header.typeNameFormat == .nfcWellKnown && payloadType == Data([0x53, 0x70]) }
    
}


