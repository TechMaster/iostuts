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
        mainScreen.title = "UIScrollView"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Basic",
                    menu: [
                        Menu(title: "Zoom", identifier: "ZoomPhoto"),
                        Menu(title: "DelegateToBlock", identifier: "DelegateToBlock"),
                        Menu(title: "DemoLayout", identifier: "DemoLayout"),
                        Menu(title: "SlidingPhotos", identifier: "SlidingPhotos")
                ])           
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
