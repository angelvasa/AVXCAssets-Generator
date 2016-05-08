//
//  IconGenerator.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 27/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation
import Cocoa

class AVIconScalar: AnyObject {
    var iconSizes = [29, 40, 50, 57, 58, 72, 76, 80 ,87, 100, 114, 120, 144, 152, 167, 180]
    
    func scaleImage(image: NSImage, withImageName: String, andSaveAtPath: String) {
        let contentCreator = ContentCreator()
        for size in iconSizes {
            let finalImage = image.resizeImage(CGFloat(size) / 2.0, CGFloat(size) / 2.0)
            let imageNameWithConvention = withImageName + "-" + "\(size)" + ".png"
            let pathToSaveImage = "\(andSaveAtPath + "/" + imageNameWithConvention)"
            contentCreator.writeImageToDirectory(image: finalImage, atPath: pathToSaveImage)
            contentCreator.writeDictionaryContent(contentCreator.defaultAppIconSetDictionary(), atPath: andSaveAtPath)
        }
    }
    
}
