//
//  NdefRecordMockup.swift
//  NfcDecoder_Example
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation
import NfcDecoder
import CoreNFC

struct NdefRecordMockup: NdefRecord {
    
    var typeNameFormat: NFCTypeNameFormat
    var type: Data
    var identifier: Data
    var payload: Data
    
    init(typeNameFormat: NFCTypeNameFormat, type: Data, payload: Data) {
        self.typeNameFormat = typeNameFormat
        self.type = type
        self.identifier = Data()
        self.payload = payload
    }
    
    var description: String { return "NdefRecordMockup" }
    
}



