//
//  Message.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class Message {
    var avatar: UIImage
    var name: String
    var short_msg: String
    var time_before: String
    var badget: String
    
    init (avatar: UIImage,
          name: String,
          short_msg: String,
          time_before: String,
          badget: String) {
        self.avatar = avatar
        self.name = name
        self.short_msg = short_msg
        self.time_before = time_before
        self.badget = badget
    }
    
}
