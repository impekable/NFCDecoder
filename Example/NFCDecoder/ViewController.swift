//
//  ViewController.swift
//  NFCDecoder
//
//  Created by Alexander Vasenin on 10/08/2018.
//  Copyright (c) 2018 Impekable LLC. MIT License.
//

import UIKit
import CoreNFC
import NFCDecoder

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var scanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func didTapScanButton(_ sender: Any) { startNfcSession() }
    
    private func display(success: Bool, message: String) {
        statusLabel.text = success ? "✅" : "❌"
        messageLabel.text = message
    }
    
    // MARK: NFC scanning
    
    private var nfcSession: NFCReaderSession?
    
    private func startNfcSession() {
        guard nfcSession == nil else { return } // Only one session is allowed
        guard NFCNDEFReaderSession.readingAvailable else { display(success: false, message: "NFC requires iPhone 7 or higher and at least iOS 11"); return }
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        nfcSession!.begin()
    }
    
    private func stopNfcSession() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Forces checkmark screen to disappear after 0.5 seconds (not 3.0) https://stackoverflow.com/a/50730560/2432781
            guard let session = self.nfcSession else { return }
            self.nfcSession = nil // ensure we ignore error caused by calling session.invalidate()
            session.invalidate()
        }
    }
    
    // MARK: NFCReaderSessionDelegate
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        guard nfcSession != nil else { return }
        display(success: false, message: error.localizedDescription)
        stopNfcSession()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        let payloads = NFCDecoder().decode(messages)
        payloads.forEach { logToConsole(payload: $0) }
        display(success: true, message: payloads.description)
        stopNfcSession()
    }
    
    func logToConsole(payload: NdefPayload) {
        switch payload {
        case .text(let text):
            print(text.text, text.languageCode)
        case .uri(let uri):
            print(uri.url.absoluteString)
        case .smartPoster(let morePayloads): // Smart poster is just a container for more payloads
            morePayloads.forEach { logToConsole(payload: $0) }
        case .empty:
            print("empty payload")
        case .unknown(_):
            print("oops")
        }
    }
    
}


