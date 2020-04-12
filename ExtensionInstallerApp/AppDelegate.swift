//
//  AppDelegate.swift
//  ExtensionInstallerApp
//
//  Created by Ahmed Abdelkarim on 3/4/19.
//  Copyright © 2019 AhmedAbdelkarim. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func okButtonClick(_ sender: Any) {
        exit(0)
    }
    
}

