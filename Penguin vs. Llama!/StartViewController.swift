//
//  StartViewController.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/17/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var animalImageViewsArray: [UIImageView] = []
    
    var llamaViewController: PhotoTableViewController?
    var penguinViewController: PhotoTableViewController?
    
    // MARK: - Outlets
    
    @IBOutlet weak var penguinImageView: UIImageView!
    @IBOutlet weak var llamaImageView: UIImageView!

    // MARK: - Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalImageViewsArray += [penguinImageView, llamaImageView]
        
        llamaViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("PhotoTable") as? PhotoTableViewController
        penguinViewController = self.navigationController?.storyboard?.instantiateViewControllerWithIdentifier("PhotoTable") as? PhotoTableViewController
        
        llamaViewController!.tagName = "Llamas"
        penguinViewController!.tagName = "Penguins"
        
        for index in 0..<animalImageViewsArray.count {
            let animal = Animals().data[index]
            let animalImageView = animalImageViewsArray[index]
            
            let imageName = animal["icon"]!
            animalImageView.image = UIImage(named: imageName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segue Action
    
    @IBAction func showImagesTable(sender: AnyObject) {
        let animalImageView = sender.view as! UIImageView!
        
        if let index = animalImageViewsArray.indexOf(animalImageView) {
            let tagName = Animals().data[index]["tagName"]!
            
            if tagName == "Penguins" {
                self.navigationController!.pushViewController(penguinViewController!, animated: true)
            } else {
                self.navigationController!.pushViewController(llamaViewController!, animated: true)
            }
        }
    }
    
}