//
//  FolderGenerator.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 23/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation
import Cocoa


class FolderGenerator: AnyObject {
    func generateFolders(atLocation destinationLocation:String, originLocation origin: String, withContents folderContent: [String]) -> Bool {
        let xcAssetPath = destinationLocation + "Assets.xcassets"
        let contentCreator = ContentCreator()
        do {
           try NSFileManager.defaultManager().createDirectoryAtPath(xcAssetPath, withIntermediateDirectories: true, attributes: nil)
            contentCreator.writeDictionaryContent(contentCreator.defaultXcassetDictionary(), atPath: xcAssetPath)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        for image in folderContent {
            if image == ".DS_Store" { /*ignore that file*/ } else {
                
                let imageSet = image.removeExtension()
                
                
                
                if imageSet == "Icon" || imageSet == "icon" {
                    let appIconPath = xcAssetPath + "/" + "AppIcon.appiconset"
                    do {
                        try NSFileManager.defaultManager().createDirectoryAtPath(appIconPath, withIntermediateDirectories: true, attributes: nil)
                        
                        guard let isImage = NSImage(contentsOfFile: origin + image) else {
                            continue
                        }
                        
                        AVIconScalar().scaleImage(isImage, withImageName: imageSet, andSaveAtPath: appIconPath)
                        
                    } catch {
                        
                    }
                    
                    
                } else {
                    let imageSetPath = xcAssetPath + "/" + imageSet + ".imageset"
                    do {
                        try NSFileManager.defaultManager().createDirectoryAtPath(imageSetPath, withIntermediateDirectories: true, attributes: nil)
                        
                        guard let isImage = NSImage(contentsOfFile: origin + image) else {
                            continue
                        }
                        
                        AVImageScalar().scaleImage(isImage, withImageName: imageSet, andSaveAtPath: imageSetPath)
                        
                    } catch {
                        
                    }
                }
                
                
            }
            
        }
        
        return true
    }
}