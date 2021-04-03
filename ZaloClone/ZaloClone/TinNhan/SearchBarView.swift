//
//  SearchBarView.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class SearchBarView: UIView {
    var gradientLayer :  CAGradientLayer!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer.frame = rect
            
            gradientLayer.colors = [UIColor(red:0.09, green:0.47, blue:1.00, alpha:1.0).cgColor, UIColor(red:0.00, green:0.73, blue:0.99, alpha:1.0).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            self.layer.addSublayer(gradientLayer)
        }        
    }

}
