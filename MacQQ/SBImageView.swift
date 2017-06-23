//
//  SBImageView.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/19.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa
import QuartzCore
class SBImageView: NSImageView {
    let highlightColor = NSColor(red:0.52, green:0.84, blue:0.96, alpha:1.00)
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let trackArea = NSTrackingArea(rect: bounds, options: [.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackArea)
        layer?.cornerRadius = bounds.width/2
        setLayerBoard(color: .lightGray, width: 1)
    }

    override func mouseEntered(with event: NSEvent) {
        setLayerBoard(color: highlightColor, width: 3)
    }
    override func mouseExited(with event: NSEvent) {
        setLayerBoard(color: .lightGray, width: 1)
    }
    func setLayerBoard(color:NSColor ,width: CGFloat) {
        layer?.borderColor = color.cgColor
        layer?.borderWidth = width
    }
}
