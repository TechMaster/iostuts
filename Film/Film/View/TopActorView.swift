//
//  TopActorView.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class TopActorView: UIView {

    var photo: UIImageView!
    var title: UILabel!
    convenience init (name: String, photo_name: String) {
        self.init(frame: CGRect.zero)
        photo = UIImageView(image: UIImage(named: photo_name))
        photo.contentMode = .scaleAspectFit
        title = UILabel(text: name, hexcolor: 0xfafafa, fontface: "SofiaPro-SemiBold", fontsize: 18)
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .center
        
        self.sv(photo, title)
        self.layout(
            0,
            |-photo.heightEqualsWidth()-|
        )
 
        title.Bottom == self.safeAreaLayoutGuide.Bottom
        title.centerHorizontally()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()  //Thử bỏ dòng lệnh đi, bạn sẽ thấy hình sẽ méo mó, bởi UIView chưa được thực sư tính toán kích thước
        photo.layer.cornerRadius = photo.bounds.width * 0.5
        photo.clipsToBounds = true
    }

}
