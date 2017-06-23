//
//  ChatViewController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    @IBOutlet weak var chatBtn: NSButton!
    @IBOutlet weak var contactBtn: NSButton!
    @IBOutlet weak var moreBtn: NSButton!
    @IBOutlet weak var baseView: NSView!
    
    
    var oldView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.window?.isRestorable = false
        view.window?.center()
        let tmpView = NSView(frame: baseView.bounds)
        baseView.addSubview(tmpView)
        baseView.wantsLayer = true
        baseView.layer?.backgroundColor = SBApplication.shared.normalColor.cgColor
        oldView = tmpView
        chatView(with: chatBtn, name: "Chat")
        
        
    }
    @IBAction func chatClicked(_ sender: Any) {
        chatView(with: sender as! NSButton, name: "Chat")
    }
    @IBAction func contactClicked(_ sender: Any) {
        chatView(with: sender as! NSButton, name: "Contact")
    }
    @IBAction func moreClicked(_ sender: Any) {
        chatView(with: sender as! NSButton, name: "More")
    }
    func initButtons() {
        chatBtn.image = #imageLiteral(resourceName: "chat_normal")
        contactBtn.image = #imageLiteral(resourceName: "contact_normal")
        moreBtn.image = #imageLiteral(resourceName: "more_normal")
    }
    func chatView(with button: NSButton, name: String) {
        initButtons()
        var vc: NSViewController?
        if name == "Chat" {
            vc = NSStoryboard(name: name, bundle: nil).instantiateInitialController() as! ChatViewController
            button.image = #imageLiteral(resourceName: "chat_highlight")
        }else if name == "Contact" {
            vc = NSStoryboard(name: name, bundle: nil).instantiateInitialController() as! ContactViewController
            button.image = #imageLiteral(resourceName: "contact_highlight")
        }else{
            vc = NSStoryboard(name: name, bundle: nil).instantiateInitialController() as! MoreViewController
            button.image = #imageLiteral(resourceName: "more_hightlight")
        }
        if let tmpView = vc?.view {
            baseView.replaceSubview(oldView, with: tmpView)
            oldView = tmpView
            addConstraint(with: tmpView)
        }
    }
    func addConstraint(with tmpView: NSView) {
        tmpView.translatesAutoresizingMaskIntoConstraints = false
        tmpView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        tmpView.leftAnchor.constraint(equalTo: baseView.leftAnchor).isActive = true
        tmpView.rightAnchor.constraint(equalTo: baseView.rightAnchor).isActive = true
        tmpView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
    }

}
