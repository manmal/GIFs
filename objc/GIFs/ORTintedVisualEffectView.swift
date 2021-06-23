//
//  ORTintedVisualEffectView.swift
//  GIFs
//
//  Created by Orta on 8/5/14.
//  Copyright (c) 2014 Orta Therox. All rights reserved.
//

import Cocoa

class ORTintedView: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor(calibratedRed: 0.162, green: 0.137, blue: 0.160, alpha: 0.75).set();
        dirtyRect.fill()
    }
    
}
