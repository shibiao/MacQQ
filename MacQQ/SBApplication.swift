//
//  Common.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/21.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

final class SBApplication: NSObject {
    static let shared = SBApplication()
    private override init() {}
    let normalColor = NSColor(red:0.99, green:0.99, blue:0.99, alpha:1.00)
    let selectedColor = NSColor(red:0.94, green:0.95, blue:0.96, alpha:1.00)
}
//struct Common {

//}
