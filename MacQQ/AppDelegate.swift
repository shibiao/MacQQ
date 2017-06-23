//
//  AppDelegate.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/19.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var mainWindowController: NSWindowController?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        self.mainWindowController?.window?.makeKeyAndOrderFront(self)
        return true
    }

}

