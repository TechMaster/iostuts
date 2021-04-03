//
//  Brick.swift
//  BrickOut
//
//  Created by Techmaster on 6/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class Brick: UIView {
    var hardness: Int!
    convenience init() {
        self.init(frame: CGRect.zero)
        hardness =  Int.random(in: 1...4)
        alpha = CGFloat(hardness) / 4.0
    }
}
