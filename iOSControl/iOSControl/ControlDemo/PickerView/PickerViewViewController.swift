//
//  PickerViewViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 3/29/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class PickerViewViewController: UIViewController {

    // Khai báo 3 control
    // 1. Label: chọn màu, khi chọn thì set màu cho label
    // 2. TextField: lấy ra tên màu được chọn
    // 3. Picker view
    
    var colors = [Color]()
    
    
    let label: UILabel = {
        let label = UILabel()
        
        label.text = "Chọn màu"
        label.frame = CGRect(x: 20, y: 70, width: 100, height: 40)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.frame = CGRect(x: 20, y: 120, width: 200, height: 40)
        textField.placeholder = "Click here"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        return textField
    }()
    
    let colorTextField: UITextField = {
        let textField = UITextField()
        
        textField.frame = CGRect(x: 20, y: 200, width: 200, height: 40)
        textField.placeholder = "Click here"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        return textField
    }()
    
    let demoPickerView: UIPickerView = {
        let picker = UIPickerView()
        
        
        return picker
    }()
    
    let colorPickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    let pickerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupToolBar()
        setupPicker()
//        setupPicker(name: "abc")
//        setupPicker(ten: "bac")
//        setupPicker("man")
        
        title = "Picker View"
        
        let redColor = Color(name: "Red", hex: "#F60000")
        let darkOrangeColor = Color(name: "Dark Orange", hex: "#FF8C00")
        let yellowColor = Color(name: "Canary Yellow", hex: "#FFEE00")
        let greenColor = Color(name: "Screamin' Green", hex: "#4DE94C")
        let azureColor = Color(name: "Brilliant Azure", hex: "#3783FF")
        let violetColor = Color(name: "American Violet", hex: "#4815AA")
        
        colors = [redColor, darkOrangeColor, yellowColor, greenColor, azureColor, violetColor]
        print("colorPickerView \(address(o: colorPickerView))")
        print("demoPickerView \(address(o: demoPickerView))")
    }
    
    func setupLayout() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(colorTextField)
        
    }
    
    func setupPicker() {
        demoPickerView.delegate = self
        demoPickerView.dataSource = self
        
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        
        textField.inputView = demoPickerView
        colorTextField.inputView = colorPickerView
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar()
        textField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let labelPicker = UIBarButtonItem(customView: pickerLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, labelPicker, spaceButton, doneButton], animated: false)
    }
    
    @objc func doneAction() {
        pickerLabel.text = "cba"
        self.view.endEditing(true)
    }
    
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    
    func address<T: AnyObject>(o: T) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
}

extension PickerViewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == demoPickerView {
            return 2
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == demoPickerView {
            return 5
        }
        return colors.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == demoPickerView {
//            return "string"
//        }
//
//        return nil
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == demoPickerView {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "string"
            
            return label
        } else {
            
            var label: UILabel!
            
            if let reuseLabel = view as? UILabel {
                label = reuseLabel
            } else {
                label = UILabel()
                label.textAlignment = NSTextAlignment.center
            }
            
            label.textColor = .white
            let color = colors[row]
            label.text = color.name
            label.layer.backgroundColor = UIColor(color.hex).cgColor
            //        label.sizeToFit()
            return label
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == colorPickerView {
        
            print(colors[row].name)
            label.textColor = UIColor(colors[row].hex)
        }
    }
}
