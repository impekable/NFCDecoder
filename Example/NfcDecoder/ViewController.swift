//
//  ViewController.swift
//  NfcDecoder
//
//  Created by Alexander Vasenin on 10/08/2018.
//  Copyright (c) 2018 Impekable LLC. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var scanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    @IBAction func didTapScanButton(_ sender: Any) {
        startNfcSession()
    }
    
    // MARK: NFC scanning
    
    private var nfcSession: NFCReaderSession?
    
    private func startNfcSession() {
        guard nfcSession == nil else { return }
        guard NFCNDEFReaderSession.readingAvailable else { resultsLabel.text = "ERROR\nNFC requires iPhone 7 or higher and at least iOS 11"; return }
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        nfcSession!.begin()
    }
    
    private func stopNfcSession() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Forces checkmark screen to disappear after 0.5 seconds (not 3.0) https://stackoverflow.com/a/50730560/2432781
            self.nfcSession!.invalidate()
            self.nfcSession = nil
        }
    }
    
    // MARK: NFCReaderSessionDelegate
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        resultsLabel.text = "ERROR\n" + error.localizedDescription
        stopNfcSession()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        resultsLabel.text = "SUCCESS\n" + messages.description
        stopNfcSession()
    }
    
    // MARK: misc
    
    private func setupAppearance() {
        scanButton.titleLabel!.font = .systemFont(ofSize: UIFont.buttonFontSize, weight: .semibold)
        scanButton.layer.borderColor = UIColor.blue.cgColor
        scanButton.layer.cornerRadius = 22
        scanButton.layer.borderWidth = 1
    }
    
}


