//
//  NdefPayload.UriPrefix.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/10/2018.
//  Copyright © 2018 Impekable LLC. MIT License.
//

import Foundation

// We MUST name this file NdefPayload.UriPrefix.swift, without the dot between Uri and Prefix,
// otherwise NdefPayload.Uri.Prefix.swift compiles before NdefPayload.Uri.swift which triggers https://bugs.swift.org/browse/SR-631

extension NdefPayload.Uri {
    
    /**
     URI prefixes (See NFC Forum URI Record Type Definition)
    */
    
    enum Prefix: UInt8 {
        
        case none = 0x00
        case httpWww = 0x01
        case httpsWww = 0x02
        case http = 0x03
        case https = 0x04
        case tel = 0x05
        case mailto = 0x06
        case ftpAnon = 0x07
        case ftpFtp = 0x08
        case ftps = 0x09
        case sftp = 0x0A
        case smb = 0x0B
        case nfs = 0x0C
        case ftp = 0x0D
        case dav = 0x0E
        case news = 0x0F
        case telnet = 0x10
        case imap = 0x11
        case rtsp = 0x12
        case urn = 0x13
        case pop = 0x14
        case sip = 0x15
        case sips = 0x16
        case tftp = 0x17
        case btspp = 0x18
        case btl2cap = 0x19
        case btgoep = 0x1A
        case tcpobex = 0x1B
        case irdaobex = 0x1C
        case file = 0x1D
        case urnEpcId = 0x1E
        case urnEpcTag = 0x1F
        case urnEpcPat = 0x20
        case urnEpcRaw = 0x21
        case urnEpc = 0x22
        case urnNfc = 0x23
        
        var string : String {
            switch self {
            case .none: return ""
            case .httpWww: return "http://www."
            case .httpsWww: return "https://www."
            case .http: return "http://"
            case .https: return "https://"
            case .tel: return "tel:"
            case .mailto: return "mailto:"
            case .ftpAnon: return "ftp://anonymous:anonymous@"
            case .ftpFtp: return "ftp://ftp."
            case .ftps: return "ftps://"
            case .sftp: return "sftp://"
            case .smb: return "smb://"
            case .nfs: return "nfs://"
            case .ftp: return "ftp://"
            case .dav: return "dav://"
            case .news: return "news:"
            case .telnet: return "telnet://"
            case .imap: return "imap:"
            case .rtsp: return "rtsp://"
            case .urn: return "urn:"
            case .pop: return "pop:"
            case .sip: return "sip:"
            case .sips: return "sips:"
            case .tftp: return "tftp:"
            case .btspp: return "btspp://"
            case .btl2cap: return "btl2cap://"
            case .btgoep: return "btgoep://"
            case .tcpobex: return "tcpobex://"
            case .irdaobex: return "irdaobex://"
            case .file: return "file://"
            case .urnEpcId: return "urn:epc:id:"
            case .urnEpcTag: return "urn:epc:tag:"
            case .urnEpcPat: return "urn:epc:pat:"
            case .urnEpcRaw: return "urn:epc:raw:"
            case .urnEpc: return "urn:epc:"
            case .urnNfc: return "urn:nfc:"
            }
        }
        
    }
    
}


