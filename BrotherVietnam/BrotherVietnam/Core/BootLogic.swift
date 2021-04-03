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
        let mainScreen = MainScreen(style: .grouped)
        mainScreen.title = "Learn Facebook SDK"
        mainScreen.about = "Written by Brother Vietnam Team"
        mainScreen.sections = [
            
            Section(title: "Login",
                    menu: [
                        Menu(title: "Custom Login", identifier: "CustomLoginVC")
                        
                ])
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
