//
//  NdefPayload.SmartPoster.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. MIT License.
//

import Foundation

extension NdefPayload {
    
    struct SmartPoster {
        
        private init() {}
        
        static func extractSubrecords(from record: NdefRecord) -> [NdefRecord] {
            precondition(record.isSmartPosterRecord)
            var subrecords = [NdefRecord]()
            var data = record.payload
            while data.count > 0 {
                let subrecordLength = RawNdefRecord(data).totalLength
                let subrecordData = Data(data[..<subrecordLength])
                let subrecord = RawNdefRecord(subrecordData)
                subrecords.append(subrecord)
                data = Data(data[subrecordLength...])
            }
            return subrecords
        }
        
    }
    
}


