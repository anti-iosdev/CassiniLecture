//
//  ImageViewController.swift
//  CassiniLecture
//
//  Created by Anti on 10/26/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            
            // checks to see if it's on screen
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.bowsette
        }
    }
}
