//
//  ValidateFormVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 8/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ValidateFormVC: UIViewController {

    @IBOutlet weak var text1: ValidateTextField!
    @IBOutlet weak var text2: ValidateTextField!
    @IBOutlet weak var text3: ValidateTextField!
    @IBOutlet weak var text4: ValidateTextField!
    @IBOutlet weak var text5: ValidateTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.tag = 100
        text2.tag = 101
        text3.tag = 102
        text4.tag = 103
        text5.tag = 104
        text1.validatorType = ValidatorType.email
        text2.validatorType = ValidatorType.age
    }



}
