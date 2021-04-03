//
//  AppDelegate.swift
//  DemoTabBar
//
//  Created by Techmaster on 4/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Garantiee the window in not nil
        guard let window = self.window else { fatalError("No Window") }
        
        let tabBarController = UITabBarController()
        
        let screenA = ScreenA()
        screenA.tabBarItem = UITabBarItem(title: "Red", image: UIImage(named: "paw"), tag: 1)
        screenA.tabBarItem
        let screenB = ScreenB()
        screenB.tabBarItem = UITabBarItem(title: "Green", image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        screenB.tabBarItem.badgeValue = "5"
        
        let screenC = ScreenC()
        screenC.tabBarItem = UITabBarItem(title: "Blue", image: UIImage(named: "target"), tag: 3)
        
        tabBarController.viewControllers = [screenA, screenB, screenC]
        window.rootViewController = tabBarController
        
        // Make it visible
        window.makeKeyAndVisible()
        return true
    }


}

