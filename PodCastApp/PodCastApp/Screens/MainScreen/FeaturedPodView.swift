//
//  FeaturedPodView.swift
//  PodCastApp
//
//  Created by Techmaster on 4/16/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class FeaturedPodView: UIImageView {
    var title: UILabel!
    var subTitle: UILabel!
    
    convenience init (data: FeaturedPodCast) {
        self.init(frame: CGRect.zero)
        title = UILabel(text: data.title, hexcolor: 0xFFFFFF, fontface: "Helvetica", fontsize: 18)
        title.frame = CGRect.zero
        subTitle = UILabel(text: data.subtitle, hexcolor: 0xFFFFFF, fontface: "Helvetica", fontsize: 12)
        subTitle.frame = CGRect.zero
        self.image = UIImage(named: data.image)
        self.frame = CGRect.zero
        self.sv(
            title,
            subTitle
        )
        
        self.layout(
            (>=10),
            |-8-title-8-|,
            4,
            |-8-subTitle-8-|,
            8
        )
        
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    
        
    }
    

}
