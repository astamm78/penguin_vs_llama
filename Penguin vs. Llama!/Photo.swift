//
//  Photo.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/19/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    
    var url: String?
    var tbUrl: String?
    var contextUrl: String?
    var width: Int?
    var height: Int?
    var image: UIImage?
    
    init(photoData: [String: AnyObject]) {

        if let url = photoData["url"] as? String {
            self.url = url
            let photoURL = NSURL(string: url)
            self.image = UIImage(data: dataFromUrl(photoURL!))
        }
        
        if let tbUrl = photoData["tbUrl"] as? String {
            self.tbUrl = tbUrl
        }
        
        if let contextUrl = photoData["originalContextUrl"] as? String {
            self.contextUrl = contextUrl
        }

        if let width = photoData["width"] as? String {
            let widthInt = Int(width)
            self.width = widthInt
        }
        
        if let height = photoData["height"] as? String {
            let heightInt = Int(height)
            self.height = heightInt
        }
        
    }
    
    func targetHeight(screenWidth: CGFloat) -> CGFloat {
        return (CGFloat(height!) / CGFloat(width!)) * screenWidth
    }
    
    func dataFromUrl(url: NSURL) -> NSData {
        return NSData(contentsOfURL: url)!
    }
    
}