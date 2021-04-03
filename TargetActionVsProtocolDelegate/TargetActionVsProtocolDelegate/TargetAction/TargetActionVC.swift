//
//  TargetActionVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class TargetActionVC: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        print("Button is tap")
    }
    @IBAction func onSwitchChange(_ sender: UISwitch) {
        print("Switch is \(sender.isOn)")
    }
    @IBAction func sliderDrage(_ sender: UISlider) {
        print("Slider value is \(sender.value)")
    }
    @IBAction func SegmentChange(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    @IBAction func onStepperChange(_ sender: UIStepper) {
        print(sender.value)
    }
    @IBAction func onTextChange(_ sender: UITextField) {
        print(sender.text!)
    }
    @IBAction func textEditingDidBegin(_ sender: UITextField) {
        print("text begin changed")
    }
    
    


}
