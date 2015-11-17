//
//  StartViewController.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/17/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoTableViewController = segue.destinationViewController as! PhotoTableViewController
        
        if segue.identifier == "showPenguinPhotos" {
            sendTagToPhotoView("Penguin", view: photoTableViewController)
        } else if segue.identifier == "showLlamaPhotos" {
            sendTagToPhotoView("Llama", view: photoTableViewController)
        }
    }
    
    func sendTagToPhotoView(tagName: String, view: PhotoTableViewController) {
        view.tagName = tagName
    }

}