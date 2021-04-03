//
//  ValidateTextField.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 8/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

//Tự UITextFieldDelegate xử lý nội bộ các sự kiện trong UITextFieldDelegate
class ValidateTextField: UITextField, UITextFieldDelegate {

    var validatorType: ValidatorType?
    var errorLabel = UILabel(frame: CGRect.zero)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // ScrollView tự xử lý event bên trong nó
        self.delegate = self
        self.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.borderStyle = .line
        self.layer.borderWidth = 1.0
        errorLabel.textColor = UIColor.red
        
    }
    
    func hideErrorLabel() {
        errorLabel.isHidden = true
    }
    
    func showErrorLabel(errMsg: String, frame: CGRect) {
        
        errorLabel.isHidden = false
        errorLabel.text = errMsg
        errorLabel.frame = frame
        if errorLabel.superview == nil {
            if let ancestorView = self.findViewController()!.view {
                ancestorView.addSubview(errorLabel)
            }
            
        }
    }
    
    //======= UITextFieldDelegate ================
    
    //Chuyển sang màu trắng background khi textField bắt đầu edit
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.superview!.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return validateTextField()
    }
    /*
     Will be called by textFieldShouldEndEditing and textFieldShouldReturn
    */
    func validateTextField() -> Bool {
        if self.validatorType == nil {
            return true
        }
        
        do {
            let text = try self.validatedText(validationType: self.validatorType!)
            print(text)
            self.layer.borderColor = UIColor.black.cgColor
            hideErrorLabel()
        } catch (let error){
            let errStr = (error as! ValidationError).message
            
            let textFieldFrame = self.superview!.convert(self.frame, to: self.findAncestorView()!)
            let errorLabelFrame = CGRect(x: textFieldFrame.origin.x,
                                      y: textFieldFrame.origin.y + textFieldFrame.size.height + 8, width: textFieldFrame.size.width, height: 20)
            
            showErrorLabel(errMsg: errStr, frame: errorLabelFrame)
            self.layer.borderColor = UIColor.red.cgColor
            return false
        }
        return true
    }
    
}
