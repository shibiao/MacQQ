//
//  ChatItemModel.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/21.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class ChatItemModel: NSObject {
    var name: String?
    var icon: String?
    var shortMessage: String?
    init(name: String,icon: String,shortMessage: String) {
        super.init()
        self.name = name
        self.icon = icon
        self.shortMessage = shortMessage
    }
}
