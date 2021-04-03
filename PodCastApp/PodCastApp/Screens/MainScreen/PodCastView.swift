//
//  CustomView.swift
//  PodCastApp
//
//  Created by Techmaster on 4/16/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class PodCastView: UIView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        self.sv(imageView, nameLabel)
        
        self.layout(
            0,
            |-0-imageView-0-| ~ 158,
            4,
            |-0-nameLabel-0-| ~ 16,
            0
        )
        
        /*imageView.image = UIImage(named: imageName)
        nameLabel.text = name*/
    }
    
    func setData(data: MyPodCast) {
        imageView.image = UIImage(named: data.photo)
        nameLabel.text = data.title
    }
    
    
}
