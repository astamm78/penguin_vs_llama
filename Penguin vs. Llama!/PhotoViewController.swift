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

    // MARK: - Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPhoto = photo {
            let imageView = UIImageView()

            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let yOffset = (self.navigationController!.navigationBar.frame.size.height + 40)
            let newWidth = screenSize.width
            let newHeight = photo!.targetHeight(newWidth)
            imageView.frame = CGRect(x: 0, y: yOffset, width: newWidth, height: newHeight)
            imageView.image = selectedPhoto.image
            self.view.addSubview(imageView)
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