//
//  Photo.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/19/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation

struct Photo {
    
    var url: String?
    var tbUrl: String?
    var contextUrl: String?
    
    init(photoData: [String: AnyObject]) {

        if let url = photoData["url"] as? String {
            self.url = url
        }
        
        if let tbUrl = photoData["tbUrl"] as? String {
            self.tbUrl = tbUrl
        }
        
        if let contextUrl = photoData["originalContextUrl"] as? String {
            self.contextUrl = contextUrl
        }
        
    }
    
}