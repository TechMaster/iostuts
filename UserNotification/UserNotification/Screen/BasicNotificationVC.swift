//
//  BasicNotificationVC.swift
//  UserNotification
//
//  Created by Techmaster on 4/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import UserNotifications

class BasicNotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        content.badge = 5
        
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 49
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 61, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    


}
