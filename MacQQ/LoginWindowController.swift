//
//  WindowController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/19.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        //隐藏titleBar透明
        window?.titlebarAppearsTransparent = true
        //隐藏title
        window?.titleVisibility = .hidden
        //背景白色
        window?.backgroundColor = .white
        //隐藏miniaturize按钮
        window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
        //隐藏zoom按钮
        window?.standardWindowButton(.zoomButton)?.isHidden = true
        //背景可以移动
        window?.isMovableByWindowBackground = true
        
        window?.isRestorable = false
        window?.center()    
    }

}
