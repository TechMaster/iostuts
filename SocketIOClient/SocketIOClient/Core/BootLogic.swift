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
        mainScreen.title = "Socket IO Client"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "SocketIO Client",
                    menu: [
                        Menu(title: "PingPong", identifier: "PingPongVC"),
                        Menu(title: "Latency", identifier: "LatencyVC"),
                        Menu(title: "Realtime Update Chart", identifier: "RealTimeUpdateChartVC"),
                        Menu(title: "Latency Update Chart", identifier: "LatencyChartVC")
                ])
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
