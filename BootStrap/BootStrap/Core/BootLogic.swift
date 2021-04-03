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
        mainScreen.title = "Bootstrap"
        mainScreen.about = "Written by cuong@techmaster.vn"
        mainScreen.sections = [
            Section(title: "Basic",
                    menu: [
                        Menu(title: "Foo", identifier: "Foo"),
                        Menu(title: "Bar", identifier: "Bar")
                ]),
            Section(title: "Intermediate",
                    menu: [
                        Menu(title: "Delegate To Block", identifier: "DelegateToBlock"),
                        Menu(title: "DemoLayout", identifier: "DemoLayout")  
                ])
            
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
