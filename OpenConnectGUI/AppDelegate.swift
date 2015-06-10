//
//  AppDelegate.swift
//  OpenConnectGUI
//
//  Created by Hannu Kröger on 9/6/2015.
//

// Icons by http://www.flaticon.com/authors/anton-saputro

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var settingsWindow: NSWindow!
    @IBOutlet weak var settingsMenuItem: NSMenuItem!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
   
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        notConnectedIcon()
        statusItem.menu = statusMenu
        settingsWindow.close()
        settingsWindow.delegate = self
    }

    @IBAction func connectClicked(sender: NSMenuItem) {
        if (sender.state == NSOffState){
            sender.state = NSOnState
            connectedIcon()
        } else {
            sender.state = NSOffState
            notConnectedIcon()
        }
    }
    
    @IBAction func settingsClicked(sender: NSMenuItem) {
        if (sender.state == NSOffState){
            sender.state = NSOnState
            settingsWindow.makeKeyAndOrderFront(self)
            NSApp.activateIgnoringOtherApps(true)
        } else {
            settingsWindow.close()
        }
    
    }
    
    @IBAction func settingsSaveClicked(sender: NSButtonCell) {
        closeSettings()
    }
    
    @IBAction func settingsCancelClicked(sender: NSButtonCell) {
        closeSettings()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    func closeSettings() {
        settingsWindow.close()
    }
    
    func connectedIcon() {
        let statusIconNotConnected = NSImage(named: "statusIconConnected")
        statusIconNotConnected?.setTemplate(true)
        statusItem.image = statusIconNotConnected
    }
    
    func notConnectedIcon() {
        let statusIconNotConnected = NSImage(named: "statusIconNotConnected")
        statusIconNotConnected?.setTemplate(true)
        
        statusItem.image = statusIconNotConnected
        
    }
    
    func windowWillClose(notification: NSNotification) {
        if ((notification.object as? NSWindow) == settingsWindow) {
            settingsMenuItem.state = NSOffState
        }
    }
}

