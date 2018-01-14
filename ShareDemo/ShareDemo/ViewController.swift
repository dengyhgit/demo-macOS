//
//  ViewController.swift
//  ShareDemo
//
//  Created by 邓永豪 on 2018/1/12.
//  Copyright © 2018年 dengyonghao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sendMail(_ sender: NSButton) {
        // send email
        let service = NSSharingService(named: .composeEmail)

        service?.delegate = self
        service?.recipients = ["email@email.com"]
        service?.subject = "Subject"
        if let service = service, service.canPerform(withItems: ["this is text content"]) {
            service.perform(withItems: ["this is text content"])
        } else {
            print("can't perform item")
        }
    }
    
}

extension ViewController: NSSharingServiceDelegate {
    public func sharingService(_ sharingService: NSSharingService, willShareItems items: [Any]) {
        print("willShareItems,Items: \(items)")
    }

    public func sharingService(_ sharingService: NSSharingService, didFailToShareItems items: [Any], error: Error) {
        print("didFailToShareItems, Items: \(items), error: \(error)")
    }

    public func sharingService(_ sharingService: NSSharingService, didShareItems items: [Any]) {
        print("didShareItems, Items: \(items)")
    }
}

