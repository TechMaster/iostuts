//
//  SlidingPhotos.swift
//  ScrollView
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class SlidingPhotos: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var photos = ["bakal", "christmas", "duck", "isabel", "joe", "olympic", "wendell", "yellow"]
    let photo_width: CGFloat = 250
    let photo_height: CGFloat = 250
    let margin: CGFloat = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupControl()
    }
    
    func setupControl() {
        scrollView.delegate = self
        scrollView.contentSize = computeScrollViewContentSize()
        for i in 0..<photos.count {
            let imageView = UIImageView(image: UIImage(named: photos[i]))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: margin + CGFloat(i) * (photo_width + margin),
                                     y: margin,
                                     width: photo_width,
                                     height: photo_height)
            imageView.tag = 100 + i
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageTab(sender:))))
            scrollView.addSubview(imageView)
        }
    }

    @objc func onImageTab(sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
    }
    //Tính kích thước cần thiết để chứa đủ dãy photo xếp hàng ngang
    func computeScrollViewContentSize() -> CGSize {
        
        return CGSize(width: CGFloat(photos.count) * (photo_width + margin), height: photo_height)
    }

    

}
