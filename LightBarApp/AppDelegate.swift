//
//  AppDelegate.swift
//  LightBarApp
//
//  Created by Daniel Strivelli on 4/21/16.
//  Copyright © 2016 DanStrivelli. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "lightIcon")
        icon?.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    


    @IBAction func ToggleClicked(sender: NSMenuItem) {
        
        let task = NSTask()
        task.launchPath = "/usr/local/bin/wemo"
        
        task.arguments = ["switch","Green", "toggle"]
        
        task.launch()
        task.waitUntilExit()
    }
}

