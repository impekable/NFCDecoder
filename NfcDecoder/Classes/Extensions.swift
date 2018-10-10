//
//  Extensions.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. All rights reserved.
//

import Foundation

extension Data {
    
    func hexEncodedString() -> String {
        return map { String(format: "%02hx", $0) } .joined()
    }
    
    func hexEncodedString(separator: String, every: Int) -> String {
        let indexes = Array(stride(from: startIndex, to: endIndex, by: every))
        let strings = indexes.map { index -> String in
            let chunk = subdata(in: index ..< Swift.min(index+every, endIndex))
            return chunk.hexEncodedString() }
        return strings.joined(separator: separator)
    }
    
}


