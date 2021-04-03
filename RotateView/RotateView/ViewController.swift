//
//  ViewController.swift
//  RotateView
//
//  Created by Techmaster on 4/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockface: UIImageView!
    @IBOutlet weak var bar: UIView!
    var gameTimer: Timer!
    var alpha: CGFloat = 0.0  //Góc quay
    var omega: CGFloat = 0.005  //Vận tốc góc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bar.center = view.center
        clockface.center = view.center
        gameTimer = Timer.scheduledTimer(timeInterval: 0.03,
                                        target: self,
                                        selector: #selector(runTimeCode),
                                        userInfo: nil,
                                        repeats: true)
        
        
    }
    @objc func runTimeCode() {
        alpha += omega
        bar.transform = CGAffineTransform.init(rotationAngle: alpha)
    }
}

