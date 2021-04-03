//
//  ViewController.swift
//  AddUIView
//
//  Created by Techmaster on 3/18/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myview: UIView?
    var sliderWidth: UISlider?
    var sliderRotate: UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printViewInfo()
        addView()
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    func printViewInfo() {
        print("width = \(self.view.bounds.width), height = \(self.view.bounds.height)")
        print("self.view.center = \(self.view.center)")
        print("\(String(describing: self.view.backgroundColor?.cgColor))")
    }
    func addView() {
        self.view.backgroundColor = UIColor(displayP3Red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        myview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myview?.backgroundColor = UIColor.blue
        self.view.addSubview(myview!)
        myview?.center = self.view.center
        let margin = 20.0
        let screenWidth = self.view.bounds.width
        
        //add sliderWidth
        sliderWidth = UISlider(frame: CGRect(x: 0, y: 0, width: (Double(screenWidth) - margin * 0.5), height: 20))
        self.view.addSubview(sliderWidth!)
        sliderWidth?.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 150)
        sliderWidth?.addTarget(self, action: #selector(ViewController.onSliderWidthChange(sender:)), for: UIControl.Event.valueChanged)
        sliderWidth?.value = 0.5
        
        
    }
    
    @IBAction func onSliderWidthChange(sender: UISlider) {
        print(sender.value)
        myview?.transform = CGAffineTransform(scaleX: CGFloat(sliderWidth!.value  * 2.0), y: CGFloat(sliderWidth!.value * 2.0))
    }


}

