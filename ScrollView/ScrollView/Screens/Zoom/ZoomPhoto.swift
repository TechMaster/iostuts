//
//  ZoomPhoto.swift
//  ScrollView
//
//  Created by Techmaster on 3/20/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ZoomPhoto: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Reset", style: .plain, target: self, action: #selector(resetZoom))
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("\(scrollView.zoomScale)")
    }
    
    
    @objc func resetZoom() {
        scrollView.zoomScale = 1.0
    }

}
