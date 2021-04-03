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
        mainScreen.title = "UIKit Control"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            Section(title: "UIViewController",
                    menu: [
                        Menu(title: "Events Cycle", identifier: "EventsCycleVC"),
                          Menu(title: "VC contains VC", identifier: "BigFatVC")
                ]),
          
            
            Section(title: "UIView",
                    menu: [
                        Menu(title: "Basic", identifier: "BasicUIViewVC"),
                        Menu(title: "Flip View", identifier: "FlipViewVC"),
                        Menu(title: "View Masking", identifier: "ViewMasking"),
                        Menu(title: "Drop Shadow", identifier: "DropShadowVC")
                ]),
            Section(title: "UILabel",
                    menu: [
                        Menu(title: "Basic", identifier: "BasicLabel"),
                        ]),
            Section(title: "UIButton",
                    menu: [
                        Menu(title: "Color button", identifier: "ColorButtonVC")
                ]),
            
            Section(title: "UITextField",
                    menu: [
                        Menu(title: "Underline Text Field", identifier: "DemoUnderlineTextField")
                ]),
            
            Section(title: "CALayer",
                    menu: [
                        Menu(title: "Basic", identifier: "CALayerVC")
                ]),
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
