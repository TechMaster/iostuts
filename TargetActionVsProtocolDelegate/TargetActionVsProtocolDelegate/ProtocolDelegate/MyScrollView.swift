//
//  MyScrollView.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class MyScrollView: UIScrollView, UIScrollViewDelegate {
    private var _photo: UIImage!
    var photo: UIImage! {
        get {
            return _photo
        }
        set {
            _photo = newValue
            imageView.image = _photo
        }
    }
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // ScrollView tự xử lý event bên trong nó
        self.delegate = self
        addImageView()
        minimumZoomScale = 0.2
        maximumZoomScale = 4.0
    }
    
    func addImageView() {
        imageView = UIImageView(frame: self.bounds)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
    }    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("Zoom")
        return self.imageView
    }

}
