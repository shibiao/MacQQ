//
//  ChatTableCellView.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/21.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class ChatTableCellView: NSTableRowView {
    enum UserType {
        case friend
        case me
    }
    //用户类型
    var type: UserType = .me
    
    var contentTextView: NSTextField = {
        let textView = NSTextField()
        textView.allowsEditingTextAttributes = true
        textView.isEditable = false
        textView.isSelectable = true
        textView.isBordered = false
        textView.maximumNumberOfLines = 1000;
        textView.font = NSFont(name: "Helvetica", size: 18.0)
        return textView
    }()
    var iconButton: NSButton = {
        let button = NSButton()
        button.layer?.cornerRadius = button.frame.width/2
        button.focusRingType = .none
        button.bezelStyle = .circular
        button.imageScaling = .scaleAxesIndependently
        return button
    }()
    var dataModel: ChatTableCellModel? {
        didSet {
            if let model = dataModel {
                contentTextView.attributedStringValue = model.attString!
                iconButton.image = NSImage(named: model.icon! as String)
            }
        }
    }
    
   

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        addSubview(iconButton)
        addSubview(contentTextView)

        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        iconButton.leftAnchor.constraint(equalTo: contentTextView.rightAnchor).isActive = true
        iconButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 50).isActive = true
        contentTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentTextView.rightAnchor.constraint(equalTo: iconButton.leftAnchor).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.layoutSubtreeIfNeeded()
    }
    
}
