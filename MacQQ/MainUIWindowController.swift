//
//  MainUIWindowController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class MainUIWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        let appDelegate = NSApp.delegate as! AppDelegate
        appDelegate.mainWindowController = self
        //设置titleBar
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.styleMask = [.fullSizeContentView,.titled,.resizable,.miniaturizable,.closable]
        window?.isMovableByWindowBackground = true
        window?.delegate = self
        updateTitleBarOfWindow(window: window!, fullScreen: false)
    }
    
    func updateTitleBarOfWindow(window: NSWindow ,fullScreen: Bool) {
        let kTitlebarHeight: CGFloat = 54.0
        let kFullScreenButtonYOrigin: CGFloat = 3.0
        let windowFrame = window.frame
        let titlebarContainerView = window.standardWindowButton(.closeButton)?.superview?.superview;
        var titlebarContainerFrame = titlebarContainerView?.frame
        titlebarContainerFrame?.origin.y = windowFrame.size.height - kTitlebarHeight
        titlebarContainerFrame?.size.height = CGFloat(kTitlebarHeight)
        titlebarContainerView?.frame = titlebarContainerFrame!
        
        var buttonX:CGFloat = 12.0
        let closeButton = window.standardWindowButton(.closeButton)
        let minimizeButton = window.standardWindowButton(.miniaturizeButton)
        let zoomButton = window.standardWindowButton(.zoomButton)
        
        for buttonView in [closeButton,minimizeButton,zoomButton] {
            var buttonFrame = buttonView?.frame
            buttonFrame?.origin.y = fullScreen ? kFullScreenButtonYOrigin : round((kTitlebarHeight - (buttonFrame?.size.height)!)/2.0)
            buttonFrame?.origin.x = CGFloat(buttonX)
            buttonX = (buttonFrame?.size.width)! + 6 + buttonX
            
            buttonView?.setFrameOrigin((buttonFrame?.origin)!)
        }
    }
}
extension MainUIWindowController: NSWindowDelegate {
    func windowDidEnterFullScreen(_ notification: Notification) {
        updateTitleBarOfWindow(window: window!, fullScreen: true)
    }
    func windowDidExitFullScreen(_ notification: Notification) {
        updateTitleBarOfWindow(window: window!, fullScreen: false)
    }
    func windowDidResize(_ notification: Notification) {
        updateTitleBarOfWindow(window: window!, fullScreen: false)
    }
}
