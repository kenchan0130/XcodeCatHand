//
//  AppDelegate.swift
//  XcodeCatHand
//
//  Created by tonishi on 2019/07/19.
//  Copyright © 2019 Tadayuki Onishi. All rights reserved.
//

import Cocoa
import SwiftyPlist

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSMenuItemValidation {
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        if let itemId = menuItem.identifier?.rawValue {
            switch itemId {
            case "AllowFullScreenModeItem":
                currentIphoneSimulatorAllowFullscreeMode()
            default:
                print("none")
            }
        }
        
        return true
    }
    

    @IBOutlet weak var menu: NSMenu!

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.statusItem.button?.title = "CatHand"
        //self.statusItem.button?.image = NSImage(named: NSImage.Name("paw"))
        self.statusItem.menu = menu
    }
    
    func updateItemStatus() {
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(self)
    }

    @IBAction func toggleFullScreenMode(_ sender: NSButton) {
        let userHomeDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
        let iphonesimulatorPlistUrl = userHomeDirectory?.appendingPathComponent("Preferences").appendingPathComponent("com.apple.iphonesimulator.plist")
        
        if (FileManager.default.fileExists(atPath: iphonesimulatorPlistUrl!.path)) {
            let plist = NSMutableDictionary(contentsOfFile: iphonesimulatorPlistUrl!.path)
     
            print("名前: ", plist!["AllowFullscreenMode"] as Any)
        } else {
            
        }
    }
    
    func currentIphoneSimulatorAllowFullscreeMode() {
        let userHomeDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
        let iphonesimulatorPlistUrl = userHomeDirectory?.appendingPathComponent("Preferences").appendingPathComponent("com.apple.iphonesimulator.plist")
        
        if (FileManager.default.fileExists(atPath: iphonesimulatorPlistUrl!.path)) {
            let plist = Plist(plistObject: NSDictionary(contentsOfFile: iphonesimulatorPlistUrl!.path)!)

            
            plist["AllowFullscreenMode"]?.number as! Bool
        } else {
            
        }
    }
}

