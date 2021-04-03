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
        mainScreen.title = "Persist Data to Disk"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Basic",
                    menu: [
                        Menu(title: "NSUserDefalt", identifier: "NSUserDefaltVC"),
                        Menu(title: "NSKeyedArchiver", identifier: "NSKeyedArchiverVC")
                ]),
            Section(title: "SQLite",
                    menu: [
                        Menu(title: "SQLite", identifier: "SQLiteVC")
                ]),
            Section(title: "CoreData",
                    menu: [
                        Menu(title: "CoreData", identifier: "CoreDataVC")
            
                ]),
            Section(title: "Realm",
                    menu: [
                        Menu(title: "Realm", identifier: "RealmVC")
                        
                ])
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
