//
//  Basic.swift
//  FormBuilder
//
//  Created by Techmaster on 3/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Eureka
class Basic: FormViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
