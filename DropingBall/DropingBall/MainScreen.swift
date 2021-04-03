//
//  MainScreen.swift
//  DropingBall
//
//  Created by Techmaster on 4/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var ball: CircleLayerView!
    var timer: Timer!
    
    let ball_y_origin: CGFloat = 60.0
    let ga: CGFloat = 1.0 // gravity acceleration
    var vy: CGFloat = 0.0 //Initial velocity in y direction
    var y:CGFloat!
    let radius:CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        y = ball_y_origin
        ball = CircleLayerView(center: CGPoint(x: view.bounds.midX, y: y),
                               radius: radius,
                               fillColor:  UIColor.red)
        view.addSubview(ball)
        
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timerLoop), userInfo: nil, repeats: true)
       
        
    }
    
    @objc func timerLoop() {
        let height = view.bounds.height
        vy = vy + ga
        y = y + vy
        if y > height - radius {
            y = height - radius
            vy = -vy
        }
        ball.center = CGPoint(x: ball.center.x, y: y)
    }
}
