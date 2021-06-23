//
//  ORWindowTitleDecorationController.swift
//  GIFs
//
//  Created by Orta on 8/7/14.
//  Copyright (c) 2014 Orta Therox. All rights reserved.
//

import Cocoa
import AppKit

@objc public class ORWindowTitleDecorationController: NSObject, NSSplitViewDelegate  {
   
    @IBOutlet weak var mainWindow: NSWindow!
    @IBOutlet weak var titleBlurView: NSView!
    @IBOutlet weak var sourceListSuperView: NSView!
    @IBOutlet weak var fakeRightSplitter: NSView!
    @IBOutlet weak var rightColumnView: NSView!

    @IBOutlet weak var itemTitle: NSTextField!
    @IBOutlet weak var sectionTitle: NSTextField!
    
    @IBOutlet weak var gridAndDetailSplitter: NSSplitView!
    
    @IBOutlet weak var giphyLogo: NSImageView!
    
    @objc public func showGiphyLogo(show:ObjCBool) {
        giphyLogo.isHidden = !show.boolValue
    }
    
    override public func awakeFromNib() {
        guard let content = mainWindow.contentView else { return }
        content.addSubview(self.titleBlurView);

        NotificationCenter.default.addObserver(self, selector: #selector(updateToolbarBlur), name: NSWindow.didResizeNotification, object: self.mainWindow)
        updateToolbarBlur()

        giphyLogo.animates = true
        
        let path = Bundle.main.path(forResource: "Giphy_API_Logo_ForWhite_Trans", ofType: "gif")!
        giphyLogo.image = NSImage(contentsOfFile: path)

    }
        
    public func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return (splitView == self.fakeRightSplitter && dividerIndex == 0) ? 180 : proposedMinimumPosition;
    }
    
    public func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return (splitView == self.fakeRightSplitter && dividerIndex == 0) ? 240 : proposedMaximumPosition;
    }
    
    public func splitView(_ splitView: NSSplitView, constrainSplitPosition proposedPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        self.updateToolbarBlur();
        return proposedPosition;
    }
    
    @objc
    func updateToolbarBlur(){
        let windowFrame = self.titleBlurView.window?.frame
        let leftColumnWidth = self.sourceListSuperView.frame.width
        let titleWidth  = windowFrame!.width - leftColumnWidth
        let titleHeight = self.titleBlurView.bounds.height
        let rightColumnWidth = self.rightColumnView.frame.width

        self.titleBlurView.frame = CGRect(x: leftColumnWidth, y: windowFrame!.height - titleHeight + 1, width: titleWidth , height: titleHeight);
        
        self.fakeRightSplitter.frame = CGRect(x: titleWidth - rightColumnWidth, y: 0, width: 1, height: titleHeight)
        
        self.itemTitle.frame = CGRect(x: titleWidth - rightColumnWidth + 2, y: 18, width: rightColumnWidth , height: 18);
        
        self.sectionTitle.frame = CGRect(x: 0,  y: 18, width: titleWidth - rightColumnWidth, height: 18);
    }
}
