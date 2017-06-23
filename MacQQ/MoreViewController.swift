//
//  MoreViewController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class MoreViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func viewWillAppear() {
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
}
