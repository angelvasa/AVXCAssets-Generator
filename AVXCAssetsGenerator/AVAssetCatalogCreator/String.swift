//
//  File.swift
//  AVAssetCatalogCreator
//
//  Created by Angel Vasa on 23/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import Foundation


extension String {
    func removeOccurence(ofString p: String) -> String {
        return self.stringByReplacingOccurrencesOfString(p, withString: "")
    }
    
    func removeExtension() -> String {
        return (NSURL(fileURLWithPath: self).URLByDeletingPathExtension?.lastPathComponent)!
    }
}