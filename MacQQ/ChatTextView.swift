//
//  ChatTextView.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/21.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa
protocol ChatTextViewDelegate {
    
    /// 聊天输入框返回消息
    ///
    /// - Parameters:
    ///   - textView: textView
    ///   - message: 返回消息
    func chatTextView(_ textView: ChatTextView, returnMessage message: NSAttributedString)
}
class ChatTextView: NSTextView {
    var chatDelegate: ChatTextViewDelegate?
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    override func keyDown(with event: NSEvent) {
        //回车键
        if event.keyCode == 36 {
            self.chatDelegate?.chatTextView(self, returnMessage: self.attributedString())
            
        }else {
            super.keyDown(with: event)
        }
    }
}
