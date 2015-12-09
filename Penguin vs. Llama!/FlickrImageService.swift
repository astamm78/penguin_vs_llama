//
//  FlickrImageService.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 12/9/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation

struct FlickrImageService {
    
    let clientBaseUrl: NSURL?
    let apiKey = "fb1790b9b54ecba5c89a89a8c9be1599"
    let apiSecret = "98dea0e44fe677a3"
    
    init(tagName: String, start: Int) {
        clientBaseUrl = NSURL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&tags=\(tagName)&page=\(start)&format=json&nojsoncallback=1")
    }
    
    func getPhotos(completion: ([FlickrPhoto]? -> Void)) {
        let networkOperation = NetworkOperation(url: clientBaseUrl!)
        networkOperation.downloadJSONFromURL {
            (let JSONDictionary) in
            
            if let photosArray = JSONDictionary!["photos"] as? [String: AnyObject] {
                if let photoList = photosArray["photo"] as? [[String: AnyObject]] {
                    let photos = photoList.map() { FlickrPhoto(photoData: $0) }
                    completion(photos)
                }
            }
        }
    }
    
}