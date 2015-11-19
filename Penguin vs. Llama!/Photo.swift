//
//  Photo.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/19/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation

enum PhotoType: String {
    case Image = "image"
    case Video = "video"
}

struct Photo {
    
    var type: PhotoType?
    var createdTime: String?
    var instagramId: String?
    var instagramUrl: String?
    var userName: String?
    var userId: String?
    
    let dateFormatter = NSDateFormatter()
    
    init(photoData: [String: AnyObject]) {
        if let photoType = photoData["type"] as? String {
            type = PhotoType(rawValue: photoType)!
        }
        
        if let timeStamp = photoData["created_time"] as? Double {
            createdTime = dateFromUnixTime(timeStamp)
        }
        
        if let instagramId = photoData["id"] as? String {
            self.instagramId = instagramId
        }
        
        if let imagesDict = photoData["images"] as? [String: AnyObject],
            let standardResolutionDict = imagesDict["standard_resolution"] as? [String: AnyObject],
            let instagramUrl = standardResolutionDict["url"] as? String {
                self.instagramUrl = instagramUrl
        }
        
        if let userDict = photoData["user"] as? [String: AnyObject] {
            userName = userDict["username"] as? String
            userId = userDict["id"] as? String
        }
    }
    
    func dateFromUnixTime(timeStamp: Double) -> String {
        let date = NSDate(timeIntervalSince1970: timeStamp)
        dateFormatter.dateFormat = "MMMM, d y"
        return dateFormatter.stringFromDate(date)
    }
    
}