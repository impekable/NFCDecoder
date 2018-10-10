//
//  RawNdefRecord.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation
import CoreNFC

/**
 Low-level representation of NFC NDEF record which contains payload described by type, length and optional identifier
 Essentially recreates NFCNDEFPayload internals for decoding smart posters payload (NFCNDEFPayload lacks public initializers)
 */

public struct RawNdefRecord: CustomStringConvertible {
    
    /// Raw data of NDEF record
    public var data: Data
    
    /// Creates NdefRecord from raw Data
    public init(_ data: Data) { self.data = data }
    
    /// Creates NdefRecord from NFCNDEFPayload
    public init(_ record: NFCNDEFPayload) { self.data = record.payload }
    
    /// First byte with TNF and various flags
    public var header: Header { return Header(rawValue: data[0]) }
    
    private var payloadTypeLength: Int { return Int(data[1]) }
    
    /// Payload length in bytes
    public var payloadLength: Int {
        precondition(!header.contains(.isChunked), "Chunked NDEF records are not supported")
        if header.contains(.isShortRecord) {
            let rawShortLength: UInt8 = data[2]
            return Int(rawShortLength)
        } else {
            let rawLongLength: UInt32 = data[2..<6].withUnsafeBytes() { return CFSwapInt32BigToHost($0.pointee) }
            return Int(rawLongLength)
        }
    }
    
    private var messageIdLengthOffset: Int { return header.contains(.isShortRecord) ? 3 : 6 }
    
    private var messageIdLength: Int { return header.contains(.hasIdLength) ? Int(data[messageIdLengthOffset]) : 0 }
    
    private var payloadTypeOffset: Int { return messageIdLengthOffset + (header.contains(.hasIdLength) ? 1 : 0) }
    
    /// Identifier describing payload type (follows structure, encoding and format defined by TNF)
    public var payloadType: Data { return Data(data[payloadTypeOffset ..< payloadTypeOffset+payloadTypeLength]) }
    
    private var messageIdOffset: Int { return payloadTypeOffset + payloadTypeLength }
    
    /// Message identifier (rarely used)
    public var messageId: Data { return Data(data[messageIdOffset ..< messageIdOffset+messageIdLength]) }
    
    private var payloadOffset: Int { return messageIdOffset + messageIdLength }
    
    /// Application data
    public var payload: Data { return Data(data[payloadOffset ..< payloadOffset+payloadLength]) }
    
    /// Total record length in bytes
    public var totalLength: Int { return payloadOffset + payloadLength }
    
    public var description: String { return "NdefRecord <\(data.hexEncodedString(separator: " ", every: 4))>" }
    
}


