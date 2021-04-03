//
//  RoundButton.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    convenience init(title: String, rgbColor: Int, cornerRadius: CGFloat?) {
        self.init(frame: CGRect.zero)
        setTitle(title, for: .normal)
        backgroundColor = UIColor(rgb: rgbColor)
        if cornerRadius != nil {
            layer.cornerRadius = cornerRadius!
        } else {
            layer.cornerRadius = 10.0
        }
        
    }

}
