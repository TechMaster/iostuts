//
//  ShadowView.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0 //Hãy thử tăng giá trị này lên
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }

}
