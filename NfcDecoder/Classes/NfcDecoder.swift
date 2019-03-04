//
//  NfcDecoder.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 09/10/2018.
//  Copyright © 2018 Impekable LLC. MIT License.
//

import Foundation
import CoreNFC

/**
 An object that decodes NFCNDEFMessage into meaningful data
 */

public class NfcDecoder {
    
    /// Creates NfcDecoder instance
    public init() {}
    
    /// Decodes multiple NFCNDEFMessage's into array of arrays of NdefPayload's
    public func decode(_ messages: [NFCNDEFMessage]) -> [[NdefPayload]] {
        return messages.map { decode($0) }
    }
    
    /// Decodes single NFCNDEFMessage into array of NdefPayload's
    public func decode(_ message: NFCNDEFMessage) -> [NdefPayload] {
        return message.records.map { decode($0) }
    }
    
    /// Decodes NFCNDEFPayload into NdefPayload
    public func decode(_ record: NFCNDEFPayload) -> NdefPayload {
        return decode(record as NdefRecord)
    }
    
    /// Decodes NdefRecord into NdefPayload
    public func decode(_ record: NdefRecord) -> NdefPayload {
        switch true {
        case record.isTextRecord:
            let text = NdefPayload.Text(record)
            return NdefPayload.text(text)
        case record.isUriRecord:
            let uri = NdefPayload.Uri(record)
            return NdefPayload.uri(uri)
        case record.isSmartPosterRecord:
            let subrecords = NdefPayload.SmartPoster.extractSubrecords(from: record)
            let payloads = subrecords.map { decode($0) }
            return NdefPayload.smartPoster(payloads)
        default:
            return NdefPayload.unknown(record)
        }
    }
    
}


