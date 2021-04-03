//
//  NSUserDefaltVC.swift
//  PersistData
//
//  Created by Techmaster on 5/16/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class NSUserDefaltVC: UIViewController {

    let getMarried_label = UILabel(frame: CGRect.zero)
    let getMarried_switch = UISwitch(frame: CGRect.zero)
    let salary_label = UILabel(frame: CGRect.zero)
    let salary_slider = UISlider(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSave))
        setupControl()
        let defaults = UserDefaults.standard
        getMarried_switch.isOn = defaults.bool(forKey: "married")
        salary_slider.value = defaults.float(forKey: "salary")
        
        onSliderChange()
    }
    
    func setupControl() {
        view.sv(getMarried_label,
                getMarried_switch,
                salary_label,
                salary_slider)
        let margin: CGFloat = 16.0
        getMarried_label.text = "Get Married"
        
        view.layout(
            100,
            |-margin-getMarried_label.width(100)-(10)-getMarried_switch.width(40)-(>=margin)-|,
            40,
            |-margin-salary_label.width(300)-(>=margin)-|,
            15,
            |-margin-salary_slider-margin-|
        )
        salary_slider.minimumValue = 200.0
        salary_slider.maximumValue = 10000.0
        salary_slider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
        onSliderChange()
        
    }
    
    @objc func onSave() {
        let defaults = UserDefaults.standard
        defaults.set(getMarried_switch.isOn, forKey: "married")
        
        defaults.set(salary_slider.value, forKey: "salary")
    }
    
    @objc func onSliderChange() {
         salary_label.text = String(format: "Salary: %.0f", salary_slider.value)
    }


    
}
