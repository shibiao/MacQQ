//
//  ChatIem.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/21.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa


class ChatIem: NSCollectionViewItem {
    @IBOutlet weak var icon: NSImageView!
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var shortMessage: NSTextField!
    
    @IBOutlet weak var backgroundView: NSView!
    let normalColor = SBApplication.shared.normalColor
    let selectedColor = SBApplication.shared.selectedColor
    var model: ChatItemModel? {
        didSet{
            if let tmpModel = model {
                self.icon.image = NSImage(named: tmpModel.icon!)
                self.name.stringValue = tmpModel.name!
                self.shortMessage.stringValue = tmpModel.shortMessage!
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        icon.wantsLayer = true
        icon.layer?.cornerRadius = icon.bounds.width/2
        backgroundView.wantsLayer = true
        backgroundView.layer?.backgroundColor = normalColor.cgColor
    }
    override var isSelected: Bool{
        didSet {
            super.isSelected = isSelected
            updateColor()
        }
    }
    func updateColor() {
        if isSelected {
            switch highlightState {
            case .none, .forDeselection:
                backgroundView.layer?.backgroundColor = normalColor.cgColor
            case .forSelection:
                backgroundView.layer?.backgroundColor = selectedColor.cgColor
            default:
                break
            }
        }else{
            backgroundView.layer?.backgroundColor = normalColor.cgColor
        }
    }
}
