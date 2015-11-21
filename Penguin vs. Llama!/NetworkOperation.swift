//
//  NetworkOperation.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/20/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completetion: JSONDictionaryCompletion) {
        let request = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    let jsonDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String: AnyObject]
                    completetion(jsonDictionary)
                default:
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }
            } else {
                print("Error: Not a valid HTTP response")
            }
        }
        dataTask.resume()
    }
    
}