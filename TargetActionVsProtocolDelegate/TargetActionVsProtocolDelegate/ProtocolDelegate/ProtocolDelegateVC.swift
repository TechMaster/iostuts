//
//  ProtocolDelegateVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ProtocolDelegateVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
 

    @IBOutlet weak var myScrollView: MyScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        myScrollView.photo = UIImage(named: "normal")
       
        
    }

}

extension ProtocolDelegateVC : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("ShouldBeginEditing")
        textField.backgroundColor = UIColor.white
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin Editing")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("User wants to clear")
        return true
    }
}
