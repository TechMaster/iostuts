//
//  AppDelegate.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { fatalError("No Window") }
       
        
        window.rootViewController = setupTabBarController()
        window.makeKeyAndVisible()
        
        return true
    }
    
    func setupTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let tinnhan_vc = TinNhanVC()
        tinnhan_vc.tabBarItem = UITabBarItem(title: "Tin nhắn", image: UIImage(named: "chat-blue"), tag: 1)
        tinnhan_vc.tabBarItem.badgeValue = "5+"
        
        let danhba_vc = DanhBaVC()
        danhba_vc.tabBarItem = UITabBarItem(title: "Danh bạ", image: UIImage(named: "contacts-blue"), tag: 2)
        danhba_vc.tabBarItem.badgeValue = "N"
        
        let nhom_vc = NhomVC()
        nhom_vc.tabBarItem = UITabBarItem(title: "Nhóm", image: UIImage(named: "people-blue"), tag: 3)
        
        let nhatky_vc = NhatKyVC()
        nhatky_vc.tabBarItem = UITabBarItem(title: "Nhật ký", image: UIImage(named: "watch-blue"), tag: 4)
        nhatky_vc.tabBarItem.badgeValue = "N"
        
        let them_vc = ThemVC()
        them_vc.tabBarItem = UITabBarItem(title: "Thêm", image: UIImage(named: "grid-blue"), tag: 5)
        them_vc.tabBarItem.badgeValue = "N"
        
        
        tabBarController.viewControllers = [tinnhan_vc, danhba_vc, nhom_vc, nhatky_vc, them_vc]
        return tabBarController
    }
}

