//
//  NFCDecoder.swift
//  NFCDecoder
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation
import CoreNFC

/**
 An object that decodes NFCNDEFMessage into meaningful data
 */

public class NFCDecoder {
    
    public init() {}
    
    /// Decodes multiple NFCNDEFMessage's into array of arrays of NdefPayload's
    public func decode(_ messages: [NFCNDEFMessage]) throws -> [[NdefPayload]] {
        return try messages.map { try decode($0) }
    }
    
    /// Decodes single NFCNDEFMessage into array of NdefPayload's
    public func decode(_ message: NFCNDEFMessage) throws -> [NdefPayload] {
        return try message.records.map { try decode($0) }
    }
    
    func decode(_ payload: NFCNDEFPayload) throws -> NdefPayload {
        return NdefPayload.empty // FIXME
    }
    
}


