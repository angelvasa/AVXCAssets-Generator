//
//  AVXCAssetsGenerator.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 23/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Cocoa

enum Buttons: Int {
    case originButton = 1
    case destinationButton = 2
}


class AVAssetCatalogCreator: NSViewController {

    var assetOriginFolderPath: String!
    var assetDestinationFolderPath: String!
    @IBOutlet weak var originPathTextField: NSTextField!
    @IBOutlet weak var destinationPathTextField: NSTextFieldCell!
    
    
    
    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        } else {
            // Fallback on earlier versions
        }
        // Do view setup here.
    }
    
    
}



// MARK: Helper
extension AVAssetCatalogCreator {
    func openPanel() -> NSOpenPanel {
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = true
        openPanel.canChooseFiles = false
        return openPanel
    }
    
    func dialogOK(question: String) {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = question
        myPopup.alertStyle = NSAlertStyle.WarningAlertStyle
        myPopup.addButtonWithTitle("OK")
        myPopup.runModal()
    }
}



// MARK: Button Actions
extension AVAssetCatalogCreator {
    @IBAction func generateAction(sender: AnyObject) {
        
        guard (self.assetOriginFolderPath) != nil else {
            self.dialogOK("Please select asset origin path")
            return
        }
        
        guard (self.assetDestinationFolderPath) != nil else {
            self.dialogOK("Please select destination path for XCAsset")
            return
        }
        
        
        let fileManager = NSFileManager.defaultManager()
        var folderContent = [String]()
        do {
          folderContent = try fileManager.contentsOfDirectoryAtPath(self.assetOriginFolderPath)
        } catch {
            
        }

        
        if FolderGenerator().generateFolders(atLocation: assetDestinationFolderPath, originLocation: assetOriginFolderPath, withContents: folderContent) {
            
        }
    }
    
    @IBAction func linkAction(sender: AnyObject) {
        if let checkURL = NSURL(string: "https://github.com/angelvasa/AVXCAssets-Generator") {
            if NSWorkspace.sharedWorkspace().openURL(checkURL) {
            }
        }
    }
    
    @IBAction func selectImagesFolder(sender: NSButton) {
        let panel = openPanel()
        let clicked = panel.runModal()
        
        if clicked == NSFileHandlingPanelOKButton {
            for url in panel.URLs {
                
                let button: Buttons = Buttons(rawValue: sender.tag)!
                
                switch button {
                    
                case .originButton:
                    assetOriginFolderPath = url.absoluteString.removeOccurence(ofString: "file://")
                    originPathTextField.stringValue = assetOriginFolderPath
                    
                case .destinationButton:
                    assetDestinationFolderPath = url.absoluteString.removeOccurence(ofString: "file://")
                    destinationPathTextField.stringValue = assetDestinationFolderPath
                    
                }
            }
        }
    }
}
