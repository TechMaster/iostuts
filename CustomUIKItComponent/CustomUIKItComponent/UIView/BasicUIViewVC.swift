//
//  BasicUIViewVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 5/8/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class BasicUIViewVC: UIViewController {

    @IBOutlet weak var motherBlue: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        motherBlue.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 4.0)
        
        print(motherBlue.subviews.count)
        let orangeB = motherBlue.subviews[1]
        orangeB.alpha = 0.5
        
    }


}
