//
//  FilmScroll.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class FilmScroll: UIView {
    let photo_scroll = UIScrollView()
    var images_count = 0
    
    convenience init(title: String, images: [String]) {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.black
        let lbltitle = UILabel(text: title, hexcolor: 0xFFFFFF, fontface: "SofiaPro-SemiBold", fontsize: 18)
        
        self.sv (
            lbltitle,
            photo_scroll
        )
        self.layout(
            4,
            |-lbltitle-|,
            4,
            |-photo_scroll-|,
            4
        )

   
        images_count = images.count
        for image_file in images {
            let photo = UIImageView(image: UIImage(named: image_file))
            photo.contentMode = .scaleAspectFit
            photo_scroll.addSubview(photo)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin: CGFloat = 2.0
        photo_scroll.contentInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        let photo_height = photo_scroll.bounds.height - 2.0 * margin
        let photo_width = photo_height / 1.45
        for (i, photo) in photo_scroll.subviews.enumerated() {
            photo.frame = CGRect(x: margin + CGFloat(i) * (photo_width + margin),
                                 y: margin,
                                 width: photo_width,
                                 height: photo_height)
            
        }
        photo_scroll.contentSize = CGSize(
            width: margin + CGFloat(images_count) * (photo_width + margin),
            height: margin)
    }
}
