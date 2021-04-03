//
//  ViewController.swift
//  RollingBall
//
//  Created by Techmaster on 3/18/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    var gameTimer: Timer!
    var ballRadius: CGFloat?
    var ball_x: CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControl()
    }

    func setUpControl() {
        //Repeat every second
        gameTimer = Timer.scheduledTimer(timeInterval: 0.0333, target: self, selector: #selector(runTimerLoop), userInfo: nil, repeats: true)
        
        ballRadius = ball.bounds.width * 0.5
        ball.center = CGPoint(x: ballRadius!, y: self.view.bounds.height - ballRadius!)
        //ball.center = CGPoint(x: self.view.bounds.width * 0.5, y: self.view.bounds.height * 0.5)
        //ball.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       
    }

    @objc func runTimerLoop() {
        //Quay đến một góc cụ thể
        //ball.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/180)
        
        
        //Quay lệch đi một góc so với vị trí hiện tại nhưng bóng đứng nguyên tại chỗ
        //ball.transform = ball.transform.rotated(by: CGFloat.pi/180)
        
        //Vừa quay và lăn tịnh tiến. Cách nối tiếp 2 CGAffineTransform không đạt hiệu quả mong muốn cho ball.center  luôn giữ nguyên
        //ball.transform = ball.transform.rotated(by: CGFloat.pi/180).translatedBy(x: 4, y: 0)
        //print("\(ball.center)")
      
        
        //Đây là cách kết hợp vừa xoay bóng quanh tâm vừa tịnh tiến theo hướng trục x bằng cách thay đổi ball.center.x
        ball.transform = ball.transform.rotated(by: CGFloat.pi/180)
        ball_x = ball.center.x + (CGFloat.pi/180) * ballRadius!
        if ball_x! > self.view.bounds.width {
            gameTimer.invalidate()
        } else {
            ball.center = CGPoint(x: ball_x!, y: ball.center.y)
        }
        
        
        
        
    }
}

