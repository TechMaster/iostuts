//
//  MainScreen.swift
//  BrickOut
//
//  Created by Techmaster on 6/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var brickWall =  Set<Brick>()
    let margin: CGFloat = 8.0
    let cols: Int = 7
    let rows: Int = 4
    let ball = Ball(R: 20.0)
    let paddle = Paddle()
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        buildBrickWall()
        initBallAndPaddle()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
    }
    func buildBrickWall() {
        let brick_width = (view.bounds.width - CGFloat(cols + 1) * margin) / CGFloat(cols)
        let brick_height: CGFloat = 20.0
        for i in 0..<rows {
            for j in 0..<cols {
                let brick = Brick()
                brick.frame = CGRect(x: margin * CGFloat(j + 1) + CGFloat(j) * brick_width,
                                     y: 40.0 + CGFloat(i) * (brick_height + margin),
                                     width: brick_width,
                                     height: brick_height)
                brick.backgroundColor = UIColor.brown
                view.addSubview(brick)
                brickWall.insert(brick)
            }
            
        }
    }
    
    func initBallAndPaddle() {
        view.addSubview(ball)
        let ycenterPaddle = view.bounds.height - 15.0
        paddle.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle)
        ball.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle - paddle.bounds.height * 0.5 - ball.radius)
        view.addSubview(paddle)
        ball.vx = 10.0
        ball.vy = -12.0
    }
    
    @objc func gameLoop() {
        var ball_new_x = ball.center.x + ball.vx
        var ball_new_y = ball.center.y + ball.vy
        // va vào thành dọc bên phải
        if ball_new_x > view.bounds.width - ball.radius {
            ball.vx = -ball.vx
            ball_new_x = view.bounds.width - ball.radius
        }
        // va thành dọc bên trái
        if ball_new_x < ball.radius {
            ball.vx = -ball.vx
            ball_new_x = ball.radius
        }

        // va vào paddle
        if ball_new_y > paddle.frame.origin.y - ball.radius {
            ball.vy = -ball.vy
            ball_new_y = paddle.frame.origin.y - ball.radius
        }
        
        //va vào đỉnh màn hình
        if ball_new_y < ball.radius {
            ball.vy = -ball.vy
            ball_new_y = ball.radius
        }
        ball.center = CGPoint(x: ball_new_x, y: ball_new_y)
    }
}
