//
//  MainWindowController.swift
//  ShareDemo
//
//  Created by 邓永豪 on 2018/1/12.
//  Copyright © 2018年 dengyonghao. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func share(sender: NSButton) {
        let image = NSImage(named: NSImage.Name(rawValue: "code.jpg"))
        let picker = NSSharingServicePicker(items: [image!])
        picker.delegate = self
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }

}

extension MainWindowController: NSSharingServicePickerDelegate {
    func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, didChoose service: NSSharingService?) {
        print(service)
    }

    func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, delegateFor sharingService: NSSharingService) -> NSSharingServiceDelegate? {
        sharingService.recipients = ["email@email.com"]
        sharingService.subject = "Subject"
        return self
    }
}

extension MainWindowController: NSSharingServiceDelegate {

}
