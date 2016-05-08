//
//  NSImage.swift
//  AVXCAssetsGenerator
//
//  Created by Angel Vasa on 25/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation
import Cocoa

extension NSImage {
    func resizeImage(width: CGFloat, _ height: CGFloat) -> NSImage {
        let image = NSImage(size: CGSizeMake(width, height))
        image.lockFocus()
        let currentContext = NSGraphicsContext.currentContext()
        currentContext?.imageInterpolation = .High
        self.drawInRect(NSMakeRect(0, 0, width, height), fromRect: NSMakeRect(0, 0, size.width, size.height), operation: .CompositeCopy, fraction: 1)
        image.unlockFocus()
        
        return image
    }
}

