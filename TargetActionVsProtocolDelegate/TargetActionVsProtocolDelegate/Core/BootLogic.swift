//
//  BootLogic.swift
//  BootStrap
//
//  Created by Techmaster on 3/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit
class BootLogic {
    
    class func boot(window: UIWindow) {
        let mainScreen = MainScreen.init(style: .grouped)
        mainScreen.title = "Handle Event"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Target Action",
                    menu: [
                        Menu(title: "Target Action Demo", identifier: "TargetActionVC"),
                       
                ]),
            
            Section(title: "Protocol Delegate", menu: [
                        Menu(title: "Protocol Delegate Demo", identifier: "ProtocolDelegateVC"),
                        Menu(title: "Multiple Text Field Demo", identifier: "FormVC"),
                        Menu(title: "Validate Text Field Demo", identifier: "ValidateFormVC")
                ])
            
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
