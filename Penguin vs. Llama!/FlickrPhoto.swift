//
//  FlickrPhoto.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 12/9/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation
import UIKit

struct FlickrPhoto {
    
    var url: String?
    var contextUrl: String?
    var width: Int?
    var height: Int?
    var image: UIImage?
    
    var flickrID: String?
    var serverID: String?
    var farmID:  Int?
    var secret: String?
    
    init(photoData: [String: AnyObject]) {
        
        if let flickrID = photoData["id"] as? String {
            self.flickrID = flickrID
        }
        
        if let serverID = photoData["server"] as? String {
            self.serverID = serverID
        }
        
        if let farmID = photoData["farm"] as? Int {
            self.farmID = farmID
        }
        
        if let secret = photoData["secret"] as? String {
            self.secret = secret
        }
        
        let url = imageUrl()
        self.url = url
        if let photoURL = NSURL(string: url) {
            if let urlData = dataFromUrl(photoURL) {
                if let imageData = UIImage(data: urlData) {
                    self.image = imageData
                }
            }
        }
        
        self.contextUrl = imageUrl()
        
        if let selfImage = self.image {
            self.width = Int(selfImage.size.width)
            self.height = Int(selfImage.size.height)
        }
        
    }
    
    func imageUrl() -> String {
        return "https://farm\(farmID!).staticflickr.com/\(serverID!)/\(flickrID!)_\(secret!).jpg"
    }
    
    func targetHeight(screenWidth: CGFloat) -> CGFloat {
        return (CGFloat(height!) / CGFloat(width!)) * screenWidth
    }
    
    func dataFromUrl(url: NSURL) -> NSData? {
        return NSData(contentsOfURL: url)
    }
    
}