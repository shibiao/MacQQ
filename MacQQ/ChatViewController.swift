//
//  ChatViewController.swift
//  MacQQ
//
//  Created by sycf_ios on 2017/4/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

import Cocoa

class ChatViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    //Header 视图
    @IBOutlet weak var headerView: NSView!
    //左SplitView
    @IBOutlet weak var leftSplitView: NSView!
    //聊天记录数据
    var messageData = [ChatItemModel]()
    //聊天输入框
    @IBOutlet var chatTextView: ChatTextView!
    
    @IBOutlet weak var toolView: NSView!
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var splitView: NSSplitView!
    let flowLayout = NSCollectionViewFlowLayout()
    //与好友聊天记录
    var friendsData = [ChatTableCellModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        setupUI()
    }
    override func viewDidAppear() {
        chatTextView.window?.makeFirstResponder(chatTextView)
        
    }
    func addData() {
        //collectionView Data
        let model1 = ChatItemModel(name: "小明", icon: "personalImg", shortMessage: "今天去哪吃饭？")
        let model2 = ChatItemModel(name: "小强", icon: "personalImg", shortMessage: "今天去哪吃饭？")
        let model3 = ChatItemModel(name: "旺财", icon: "personalImg", shortMessage: "今天去哪吃饭？")
        let model4 = ChatItemModel(name: "王五", icon: "personalImg", shortMessage: "今天去哪吃饭？")
        messageData.append(model1)
        messageData.append(model2)
        messageData.append(model3)
        messageData.append(model4)
        
        
    }
    func setupUI() {
        headerView.wantsLayer = true
        headerView.layer?.backgroundColor = NSColor.white.cgColor
        leftSplitView.wantsLayer = true
        leftSplitView.layer?.backgroundColor = SBApplication.shared.normalColor.cgColor
        toolView.wantsLayer = true
        toolView.layer?.backgroundColor = NSColor(red:0.99, green:0.99, blue:0.99, alpha:1.00).cgColor
        //配置聊天输入框
        configChatTextView()
        //配置collectionView
        configCollectionView()
        //配置消息显示tableView
        configTableView()

    }
    //配置collectionView
    func configCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            self.flowLayout.itemSize = NSMakeSize(self.collectionView.frame.width, 70)
            self.flowLayout.minimumLineSpacing = 0
            self.flowLayout.minimumInteritemSpacing = 0
            self.collectionView.collectionViewLayout = self.flowLayout
            let nib = NSNib(nibNamed: "ChatIem", bundle: nil)
            self.collectionView.register(nib, forItemWithIdentifier: "ChatIem")
            self.collectionView.wantsLayer = true
            self.collectionView.layer?.backgroundColor = SBApplication.shared.normalColor.cgColor
        }
    }
    //配置消息显示tableView
    func configTableView() {
        tableView.selectionHighlightStyle = .none
        NotificationCenter.default.addObserver(self, selector: #selector(screenResize), name: NSNotification.Name.NSWindowDidResize, object: nil)
    }
    func screenResize() {
        tableView.reloadData()
        collectionView.reloadData()
    }
    //配置聊天输入框
    func configChatTextView() {
        chatTextView.chatDelegate = self
        
        
    }

}
//MARK : NSCollectionViewDelegate,dataSource,FlowLayout
extension ChatViewController: NSCollectionViewDataSource,NSCollectionViewDelegate {
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageData.count
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: "ChatIem", for: indexPath) as! ChatIem
        item.model = messageData[indexPath.item]
        return item
    }
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
    }
    

}
//MARK: ChatTextViewDelegate
extension ChatViewController: ChatTextViewDelegate{
    func chatTextView(_ textView: ChatTextView, returnMessage message: NSAttributedString) {
        let newData = ChatTableCellModel(icon: "personalImg", attributedString: message)
        friendsData.append(newData)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let rect = self.tableView.rect(ofRow: self.friendsData.count - 1)
            self.tableView.scroll(NSMakePoint(rect.origin.x, rect.origin.y))
            
        }
    }
}
extension ChatViewController: NSTableViewDataSource ,NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return friendsData.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.make(withIdentifier: "me", owner: self) as! ChatTableCellView
        cell.dataModel = friendsData[row]
        return cell
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
       let string = friendsData[row].attString
        let size = string?.boundingRect(with: NSMakeSize(tableView.bounds.width - 80, CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, context: nil).size
        let height: CGFloat
        if let s = size {
            height = s.height
            return height
        }
        return 0
    }

    
}
extension ChatViewController: NSSplitViewDelegate {
    func splitViewDidResizeSubviews(_ notification: Notification) {
        self.flowLayout.itemSize = NSMakeSize(self.collectionView.frame.width, 70)
    }
}
