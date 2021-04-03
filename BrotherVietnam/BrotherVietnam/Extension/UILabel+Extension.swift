//
//  UILabel+Extension.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
extension UILabel {
    convenience init (text: String) {
        self.init()
        self.text = text
    }
    
    convenience init (text: String, hexcolor: Int, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = UIColor(rgb: hexcolor)
        self.font = font
    }
    
    convenience init (text: String, hexcolor: Int, fontface: String, fontsize: CGFloat) {
        self.init()
        self.text = text
        self.textColor = UIColor(rgb: hexcolor)
        self.font = UIFont(name: fontface, size: fontsize)
    }
}
