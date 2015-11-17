//
//  StartViewController.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/17/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    let animalTagArray: [String] = ["Penguins", "Llamas"]
    
    var animalImagesArray: [UIImageView] = []
    
    @IBOutlet weak var penguinImageView: UIImageView!
    @IBOutlet weak var llamaImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animalImagesArray += [penguinImageView, llamaImageView]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoTableViewController = segue.destinationViewController as! PhotoTableViewController
        
        if segue.identifier == "showImagesTable" {
            let animalImageView = sender!.view as! UIImageView!
            if let index = animalImagesArray.indexOf(animalImageView) {
                let tagName = animalTagArray[index]
                sendTagToPhotoView(tagName, view: photoTableViewController)
            }
        }
    }

    func sendTagToPhotoView(tagName: String, view: PhotoTableViewController) {
        view.tagName = tagName
    }

    @IBAction func showImagesTable(sender: AnyObject) {
        performSegueWithIdentifier("showImagesTable", sender: sender)
    }
    
    
}