//
//  ViewController.swift
//  BasicUIView
//
//  Created by Techmaster on 5/3/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewA: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     /*   viewA.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 3.0)
        
        for view in viewA.subviews {
            view.backgroundColor = UIColor.black
        }
        
        print("viewA.subviews.count = \(viewA.subviews.count)")
        //Cach1
        let blueView = viewA.viewWithTag(16)
        blueView?.backgroundColor = UIColor.blue
        blueView?.center = CGPoint(x: viewA.bounds.size.width * 0.5, y: viewA.bounds.size.height * 0.5)
        
        
        //Cach2
        if let blueView = viewA.viewWithTag(13) {
            blueView.backgroundColor = UIColor.blue
            blueView.center = CGPoint(x: viewA.bounds.size.width * 0.5, y: viewA.bounds.size.height * 0.5)
        }*/
        
        print(self.view.superview)
        
    }


}


