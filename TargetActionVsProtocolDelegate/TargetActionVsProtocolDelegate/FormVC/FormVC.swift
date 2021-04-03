//
//  FormVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class FormVC: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var text1: MyTextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text2.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text3.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text4.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text1.delegate = self
        text2.delegate = self
        text3.delegate = self
        text4.delegate = self
        text1.validatorType = ValidatorType.email
        text1.tag = 100
        text2.tag = 101
        text3.tag = 102
        text4.tag = 103
        errorLabel.text = ""
        text4.rightViewMode = .always
        text4.rightView = UIImageView(image: UIImage(named: "dolar"))
    }
    
    
}

extension FormVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if validateTextField(textField: textField) {
            errorLabel.text = ""
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if validateTextField(textField: textField) {
            errorLabel.text = ""
            if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
            return true
        } else {
            return false
        }
    }

    
    func validateTextField (textField: UITextField) -> Bool {
        if let myText = textField as? MyTextField {
            do {
                let text = try myText.validatedText(validationType: myText.validatorType!)
                print(text)
            } catch (let error){
                let errStr = (error as! ValidationError).message
                
                let textFieldFrame = stackView.convert(textField.frame, to: view)
                errorLabel.frame = CGRect(x: textFieldFrame.origin.x,
                                          y: textFieldFrame.origin.y + textFieldFrame.size.height + 8, width: textFieldFrame.size.width, height: 20)
                
                errorLabel.text = errStr
                textField.borderStyle = .line
                textField.layer.borderWidth = 1.0
                textField.layer.borderColor = UIColor.red.cgColor
                return false
            }
        }
        return true
    }
}
