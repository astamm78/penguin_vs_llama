//
//  GoogleImageService
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/20/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation

struct GoogleImageService {
    
    let clientBaseUrl: NSURL?
    
    init(tagName: String, start: Int) {
        clientBaseUrl = NSURL(string: "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=\(tagName)&as_filetype=jpg&start=\((start - 1) * 4)")
    }
    
    func getPhotos(completion: ([GooglePhoto]? -> Void)) {
        let networkOperation = NetworkOperation(url: clientBaseUrl!)
        networkOperation.downloadJSONFromURL {
            (let JSONDictionary) in
            if let responseData = JSONDictionary!["responseData"] as? [String: AnyObject] {
                if let results = responseData["results"] as? [[String: AnyObject]] {
                    let photos = results.map() { GooglePhoto(photoData: $0) }
                     completion(photos)
                }
            }
        }
    }
    
}