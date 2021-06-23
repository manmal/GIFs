//
//  ShadowView.swift
//  GIFs
//
//  Created by Orta on 8/7/14.
//  Copyright (c) 2014 Orta Therox. All rights reserved.
//

import Cocoa

class ShadowView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor(patternImage: NSImage(named: "shadow")!).set();
        dirtyRect.fill();
    }
}
