//
//  AppDelegate.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 23/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var avAssetCatalogViewController: AVAssetCatalogCreator!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.avAssetCatalogViewController = AVAssetCatalogCreator(nibName: "AVXCAssetsGenerator", bundle: nil)
        window.contentView?.addSubview(self.avAssetCatalogViewController.view)
        self.avAssetCatalogViewController.view.frame = (window.contentView?.bounds)!
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }


}

