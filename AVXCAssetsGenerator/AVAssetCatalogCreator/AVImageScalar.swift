//
//  AVImageScalar.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 23/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation
import Cocoa


class AVImageScalar: AnyObject {
    
    var iOSAssets = [
        "@1x"    : "3",
        "@2x" : "1.5",
        "@3x" : "1"
    ]
    
    func scaleImage(image: NSImage, withImageName: String, andSaveAtPath: String) {
        let contentCreator = ContentCreator()
        let defaultContentDictionary = contentCreator.defaultImageSetDictionary()
        var defaultContentImages = defaultContentDictionary!["images"] as! NSArray
        for (namingConvention, scale) in iOSAssets {
            let rep = image.representations[0]
            let scaleFactor = CGFloat((scale as NSString).doubleValue)
            let finalSize = CGSizeMake((CGFloat(rep.pixelsWide) / scaleFactor) , CGFloat(rep.pixelsHigh) / scaleFactor)
            let finalImage = image.resizeImage(finalSize.width / 2.0, finalSize.height / 2.0)
            var namingConventionToAdd = namingConvention
            
            if namingConventionToAdd.removeOccurence(ofString: "@") == "1x" {
                namingConventionToAdd = ""
            }
            
            let imageNameWithConvention = withImageName + namingConventionToAdd + ".png"
            let pathToSaveImage = "\(andSaveAtPath + "/" + imageNameWithConvention)"
            contentCreator.writeImageToDirectory(image: finalImage, atPath: pathToSaveImage)
            defaultContentImages = contentCreator.alterArray(defaultContentImages, withScale: namingConvention, andName: imageNameWithConvention)
        }
        
        defaultContentDictionary!["images"] = defaultContentImages
        
        
        contentCreator.writeDictionaryContent(defaultContentDictionary!, atPath: andSaveAtPath)
    }
    
    
    
    
    
    
    
}