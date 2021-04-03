//
//  CountDownClock.swift
//  MemoryGame
//
//  Created by Techmaster on 3/25/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

typealias timeOutHandler = () -> Void

class CountDownClock: UIView {

    var timer: Timer!

    var clockHand =  UIView()
    var clockFace = UIImageView(image: UIImage(named: "clockface"))
    var clockCenter = UIView()
    
    let initialAngle = -Double.pi
    var angle =  -Double.pi
    var deltaAngle: Double = 0.0
    let timeInterval: Double = 0.1
    
    var onTimeOut: timeOutHandler?
    
    
    init(size: CGSize) {
        super.init(frame: CGRect.zero)

        let width = min(size.width, size.height)
        
        clockHand.backgroundColor = UIColor.red
        clockHand.bounds = CGRect(x: 0, y: 0, width: 4.0, height: width * 0.5)
        
        clockCenter.backgroundColor = UIColor.red
        clockCenter.bounds = CGRect(x: 0, y: 0, width: 8.0, height: 8.0)
        clockCenter.layer.cornerRadius = 4.0
        
        self.sv(clockFace, clockHand, clockCenter)
        
        clockFace.width(width).height(width).centerInContainer()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
        clockHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.2)
        clockHand.center = clockFace.center
        clockCenter.center = clockFace.center
        clockHand.transform = CGAffineTransform.init(rotationAngle: CGFloat(initialAngle))
        
    }
    func start(timeoutInSec: Double) {
        angle = initialAngle
        clockHand.transform = CGAffineTransform.init(rotationAngle: CGFloat(angle))
        
        deltaAngle = (Double.pi * 2.0 * timeInterval) / timeoutInSec
      
        //Nếu tạo timer trong khi có một timer khác đang chạy thì hàm timeloop sẽ chạy hai lần đồng thời, khiến cho kim quay nhanh hơn gấp đôi
        if timer == nil {
           timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timeloop), userInfo: nil, repeats: true)
        }
    }
    

    @objc func timeloop() {
        angle += deltaAngle
        if (angle > Double.pi) {
            stop()
            onTimeOut!()
        } else {
            clockHand.transform = CGAffineTransform.init(rotationAngle: CGFloat(angle))
        }
        
    }
    
    func stop() {
        timer.invalidate()
        timer = nil
    }
}
