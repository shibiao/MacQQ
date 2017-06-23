//
//  ViewController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/19.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {
    @IBOutlet weak var accountField: NSTextField!
    @IBOutlet weak var passwordField: NSTextField!
    @IBOutlet weak var iconImg: SBImageView!
    var subWindow: NSWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.window?.isRestorable = false
        view.window?.center()
    }
    override func viewDidAppear() {

        if accountField.stringValue.isEmpty {
            accountField.becomeFirstResponder()
        }else{
            passwordField.becomeFirstResponder()
        }
    }
    @IBAction func login(_ sender: Any) {
        if !accountField.stringValue.isEmpty && !passwordField.stringValue.isEmpty{
            let mainWindowController = NSStoryboard.init(name: "MainUI", bundle: nil).instantiateInitialController() as! MainUIWindowController
            mainWindowController.window?.makeKeyAndOrderFront(nil)
            view.window?.close()
        }
    }
    
    @IBAction func showOrHideSubWindow(_ sender: Any) {
        let btn = sender as! NSButton
        if btn.image == #imageLiteral(resourceName: "loginDown") {
            subWindow = NSWindow(contentRect: NSMakeRect((self.view.window?.frame.origin.x)!, (self.view.window?.frame.origin.y)! - 75, (self.view.window?.frame.size.width)!, 75), styleMask: .titled, backing: .nonretained, defer: true)
            let setupViewController = NSStoryboard.init(name: "Main", bundle: nil).instantiateController(withIdentifier: "login") as! LoginSetupViewController
            subWindow?.contentViewController = setupViewController
            view.window?.addChildWindow(subWindow!, ordered: .below)
        }else{
            view.window?.removeChildWindow(subWindow!)
            subWindow?.setFrame(NSZeroRect, display: false)
        }
        btn.image = btn.image == #imageLiteral(resourceName: "loginDown") ? #imageLiteral(resourceName: "loginUp") :#imageLiteral(resourceName: "loginDown")
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

