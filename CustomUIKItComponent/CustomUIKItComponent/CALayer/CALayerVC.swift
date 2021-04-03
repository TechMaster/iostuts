//
//  CALayerVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 4/3/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
//import Stevia
class CALayerVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.white
        let circularView = CircleLayerView(center: view.center, radius: 20, fillColor: UIColor.blue)
        
        let width: CGFloat = 200.0
        let height: CGFloat = 100.0
        let ovalView = CircleLayerView(frame: CGRect(x: view.bounds.midX - width * 0.5, y: view.bounds.midY + 40, width: width, height: height), fillColor: UIColor.red)
       
        
        view.addSubview(circularView)
        view.addSubview(ovalView)

    }
    

    

}
