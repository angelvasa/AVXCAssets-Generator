//
//  ContentCreator.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 25/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation
import Cocoa

class ContentCreator: AnyObject {
    func defaultImageSetDictionary() -> NSMutableDictionary? {
        let bundlePath = NSBundle.mainBundle().pathForResource("ContentCreator", ofType: "plist")
        let  resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath!)
        return resultDictionary!
    }
    
    func defaultXcassetDictionary() -> NSMutableDictionary{
        let bundlePath = NSBundle.mainBundle().pathForResource("XCAssetContent", ofType: "plist")
        let  resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath!)
        return resultDictionary!
    }
    
    func defaultAppIconSetDictionary() -> NSMutableDictionary {
        let bundlePath = NSBundle.mainBundle().pathForResource("IconContent", ofType: "plist")
        let  resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath!)
        return resultDictionary!
    }
    
    
    func writeDictionaryContent(content: AnyObject, atPath: String) {
        
        let theJSONData = try! NSJSONSerialization.dataWithJSONObject(content, options: .PrettyPrinted)
        let theJSONText = String(data: theJSONData, encoding: NSASCIIStringEncoding)
        let file = "Contents.json"
        
        
        do {
            try theJSONText!.writeToFile(atPath + "/" + file, atomically: false, encoding: NSUTF8StringEncoding)
        } catch {
            
        }
    }
    
    func writeImageToDirectory(image i: NSImage, atPath p: String) {
        let data = i.TIFFRepresentation
        let bitmap = NSBitmapImageRep(data: data!)
        let finalData = bitmap!.representationUsingType(.NSPNGFileType, properties: [:])
        finalData?.writeToFile(p, atomically: false)
    }
    
    func alterArray(fromArray: NSArray, withScale scale: String, andName name: String) -> NSArray! {
        var finalImages = [AnyObject]()
        for imageObject in fromArray {
            let tempDictionary = imageObject as! NSMutableDictionary
            
            if tempDictionary["scale"] as! String == scale.removeOccurence(ofString: "@") {
                tempDictionary["filename"] = name
            }
            finalImages.append(tempDictionary)
        }
        
        return finalImages as NSArray
        
    }
}