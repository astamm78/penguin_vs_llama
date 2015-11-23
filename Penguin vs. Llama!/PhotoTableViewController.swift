//
//  PhotoTableViewController.swift
//  Penguin vs. Llama!
//
//  Created by Andrew Stamm on 11/17/15.
//  Copyright © 2015 Andrew Stamm. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    var tagName: String?
    var photos: [Photo] = []
    var pageNumber: Int = 0

    @IBOutlet weak var tagNameLabel: UILabel?

    // MARK: - Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLoadingView(true)
        
        if let _ = tagName {
            retrievePhotos()
         }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoTableViewCell") as! PhotoTableViewCell

        let cellPhoto = photos[indexPath.row]
        
        if let image = cellPhoto.image {
            cell.cellPhotoImage.image = image
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let newWidth = screenSize.width
            let newHeight = cellPhoto.targetHeight(newWidth)
            cell.cellPhotoImage.frame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        }

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let photo = photos[indexPath.row]
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let newHeight = photo.targetHeight( screenSize.width )
        return newHeight
    }
    
    // MARK: - Loading Screen
    
    func showLoadingView(showView: Bool) {
        let loadingView = NSBundle.mainBundle().loadNibNamed("Loading", owner: self, options: nil).last as? UIView
        if showView {
            let width = tableView.frame.width
            let height = tableView.frame.height
            let yOffset = tableView.contentOffset.y
            
            loadingView?.frame = CGRect(x: 0, y: yOffset, width: width, height: height)
            self.view.addSubview(loadingView!)
        } else {
            for subview in self.view.subviews {
                if (subview is LoadingView) {
                    subview.removeFromSuperview()
                }
            }
        }
    }

    // MARK: - Photo Fetching
    
    @IBAction func loadMorePhotos() {
        showLoadingView(true)
        retrievePhotos()
    }

    func retrievePhotos() {
        pageNumber += 1
        
        let googleImageService = GoogleImageService(tagName: tagName!, start: pageNumber)
        
        googleImageService.getPhotos() {
            (let photos) in
            if let photoResults = photos {
                dispatch_async(dispatch_get_main_queue()) {
                    self.photos += photoResults
                    self.tagNameLabel?.text = "\(self.tagName!)"
                    
                    self.tableView.reloadData()
                    self.showLoadingView(false)
                }
            }
        }
    }

}