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
        mainScreen.title = "Facebook SDK"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Login",
                    menu: [
                        Menu(title: "Basic", identifier: "LoginBasicVC"),
                        Menu(title: "Custom Login Button", identifier: "CustomLoginVC"),
                        
                ]),
            
            Section(title: "Share",
                    menu: [
                        Menu(title: "Share", identifier: "ShareVC")
                ]),
            Section(title: "Account Kit",
                    menu: [
                        Menu(title: "Create Acco", identifier: "ShareVC")
                ])
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
