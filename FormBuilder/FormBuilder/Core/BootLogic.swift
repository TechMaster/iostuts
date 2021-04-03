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
        mainScreen.title = "Form Builder"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            AppSection(title: "Basic",
                    menu: [
                        Menu(title: "Basic", identifier: "Basic"),
                    
                ]),
          
            
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
