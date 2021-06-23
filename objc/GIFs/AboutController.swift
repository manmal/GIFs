//
//  AboutController.swift
//  GIFs
//
//  Created by Orta on 8/31/14.
//  Copyright (c) 2014 Orta Therox. All rights reserved.
//

import Foundation
import AppKit

class AboutController : NSObject {
    
    @IBOutlet weak var subtitleField: NSTextField!
    @IBOutlet weak var aboutWindow: NSWindow!
    @IBOutlet weak var mainWindow: NSWindow!
    @IBOutlet weak var backgroundImageView: NSImageView!
    
    @IBOutlet weak var titleBackgroundView: NSView!
    
    override func awakeFromNib() {
        titleBackgroundView.layer!.backgroundColor = NSColor(calibratedWhite: 0, alpha: 0.3).cgColor
    }
    
    @IBAction func openModal(sender: AnyObject) {
        
        let rando:UInt32 = arc4random_uniform(13)
        backgroundImageView.image = NSImage(named: "about\(rando)")
        
        mainWindow.beginSheet(aboutWindow, completionHandler:nil)
    }

    
    @IBAction func closeModal(sender: AnyObject) {
        mainWindow.endSheet(aboutWindow)
    }
    
    @IBAction func openGithub(sender: AnyObject) {
        let workspace = NSWorkspace.shared
        workspace.open(NSURL(string: "http://github.com/orta")! as URL);
    }
    
    @IBAction func openTwitter(sender: AnyObject) {
        let workspace = NSWorkspace.shared
        if workspace.fullPath(forApplication: "Tweetbot") != nil {
            workspace.open(NSURL(string: "tweetbot:///user_profile/orta")! as URL);
            
        } else {
            workspace.open(NSURL(string: "http://twitter.com/orta")! as URL);
        }
        
    }
    
    @IBAction func openMySite(sender: AnyObject) {
        let workspace = NSWorkspace.shared
        workspace.open(NSURL(string: "http://orta.io")! as URL);

    }
}
