//
//  DropShadowVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
// Tham khảo từ bài viết này https://medium.com/bytes-of-bits/swift-tips-adding-rounded-corners-and-shadows-to-a-uiview-691f67b83e4a

import UIKit
import Stevia
class DropShadowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let shadowView = ShadowView()
        let photo = UIImageView(image: UIImage(named: "ferarrioB"))
        view.sv(
            shadowView.sv(photo)
        )
        let margin: CGFloat = 12.0
        shadowView.layout (
            margin,
            |-(margin)-photo-(margin)-|,
            margin
        )
        shadowView.backgroundColor = UIColor.white
        shadowView.width(300).height(400).centerInContainer()
        shadowView.transform = CGAffineTransform(rotationAngle: 0.08)
    }
}
