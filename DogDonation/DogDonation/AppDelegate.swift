//
//  AppDelegate.swift
//  DogDonation
//
//  Created by Techmaster on 3/27/19.
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
        
        
        window.rootViewController = setupTabBar()
        window.makeKeyAndVisible()
        return true
    }
    
    func setupTabBar()->UITabBarController {
        let tabBarController = UITabBarController()
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), selectedImage:  UIImage(named: "Home"))
        
        let donationVC = DonationVC()
        donationVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Donation"), selectedImage:  UIImage(named: "Donation"))
        
        let favoriteVC = FavoriteVC()
        favoriteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Favorite"), selectedImage:  UIImage(named: "Favorite"))
        
        let findVC = FindVC()
        findVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Find"), selectedImage:  UIImage(named: "Find"))
        
        let trainVC = TrainVC()
        trainVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Train"), selectedImage:  UIImage(named: "Train"))
        
        
        
        tabBarController.setViewControllers([homeVC, donationVC, favoriteVC, findVC, trainVC], animated: false)
        tabBarController.tabBar.tintColor = UIColor(red:0.87, green:0.33, blue:0.24, alpha:1.0)
        
        tabBarController.selectedIndex = 0
        return tabBarController
    }

}

