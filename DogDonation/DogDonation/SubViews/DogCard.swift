//
//  DogCard.swift
//  DogDonation
//
//  Created by Techmaster on 3/27/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class DogCard: UIView {
    
    convenience init(name: String, image: UIImage, favourite: Bool) {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        let dogPhoto = UIImageView(image: image)
        dogPhoto.contentMode = .scaleAspectFit
        
        let dogName = UILabel(text: "Barkley", hexcolor: 0x262527, fontface: "SofiaPro-Regular", fontsize: 18.0)
        
        let fav_icon = UIImageView(image: UIImage(named: favourite ? "favourite": "not_favourite"))
   
        self.sv(dogPhoto, dogName, fav_icon)
        self.layout(
            6,
            |-dogPhoto-|,
            |-dogName-(>=30)-fav_icon-|,
            6
        )
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 6.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 5.0 //Hãy thử tăng giá trị này lên
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }

}
