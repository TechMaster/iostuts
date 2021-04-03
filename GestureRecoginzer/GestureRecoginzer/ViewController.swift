//
//  ViewController.swift
//  GestureRecoginzer
//
//  Created by Techmaster on 6/13/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeUp.direction = .up
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeDown.direction = .down
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeRight.direction = .right
        
                
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func onSwipe(sender: UIGestureRecognizer) {
        if let swipe = sender as? UISwipeGestureRecognizer {
            print(swipe.numberOfTouches)
            switch swipe.direction {
            case .up:
                label.text = "Up"
            case .down:
                label.text = "Down"
            case .left:
                label.text = "Left"
            case .right:
                label.text = "Right"
            default:
                label.text = "Unknown"
            }
            
        }
        
    }


}

