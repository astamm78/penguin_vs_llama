//
//  PhotoViewController.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/17/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photo: Photo?
    
    // MARK: - Outlets

    @IBOutlet weak var detailImageView: UIImageView!

    // MARK: - Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPhoto = photo {
            detailImageView.image = selectedPhoto.image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Button Functions
    
    @IBAction func viewSource() {
        if let selectedPhoto = photo,
        let urlString = selectedPhoto.contextUrl {
            openInSafari(urlString)
        }
    }
    
    @IBAction func viewOriginalImage() {
        if let selectedPhoto = photo,
        let urlString = selectedPhoto.url {
            openInSafari(urlString)
        }
    }
    
    // MARK: - Open in Safari
    
    private func openInSafari(urlString: String) {
        if let url = NSURL(string: urlString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }

}