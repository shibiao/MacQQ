//
//  ChatTableCellModel.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/24.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class ChatTableCellModel: NSObject {
    var attString: NSAttributedString?
    var icon: NSString?
    var height: CGFloat?
    init(icon: NSString, attributedString: NSAttributedString) {
        self.icon = icon
        self.attString = attributedString
    }
}
