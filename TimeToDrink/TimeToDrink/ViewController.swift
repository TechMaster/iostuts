//
//  ViewController.swift
//  TimeToDrink
//
//  Created by Techmaster on 3/17/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var displayTimeLeft: UILabel!
    @IBOutlet weak var progressTimeLeft: UIProgressView!
    @IBOutlet weak var cupOfWater: UIImageView!
    var minutesToDrink: Float = 0.1
    let timeInterval: Double = 1
    var timeCounter : Int = 0
    
    var gameTimer: Timer!
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControl()
        
    }
    
    func setUpControl() {
        timeCounter = Int(minutesToDrink * 60)
        
        progressTimeLeft.progress = 1.0
        
        //cupOfWater.alpha = 0.0
        
        //Repeat every second
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(runTimerLoop),
                                         userInfo: nil,
                                         repeats: true)
        
    }
    
    @objc func runTimerLoop() {
        
        if (timeCounter > 0) {
            timeCounter = timeCounter - 1
            
            displayTimeLeft.text = "\(timeCounter/60):\(timeCounter % 60)"
            progressTimeLeft.progress = Float(timeCounter) / (minutesToDrink * 60)
        } else { //It is time to drink
            gameTimer.invalidate()
            /*UIView.animate(withDuration: 1, animations: {
                self.cupOfWater.alpha = 1.0
            }) { (_) in
                self.gameTimer.fire()
                self.setUpControl()
            }*/
            shake(viewToShake: cupOfWater, count: 20)
        }
    }
    
    func shake(viewToShake: UIView, count: Int) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.setUpControl()
        })
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = Float(count)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: viewToShake.center.x - 10, y: viewToShake.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: viewToShake.center.x + 10, y: viewToShake.center.y))
        
        viewToShake.layer.add(animation, forKey: "position")
        CATransaction.commit()
    }

    

}

