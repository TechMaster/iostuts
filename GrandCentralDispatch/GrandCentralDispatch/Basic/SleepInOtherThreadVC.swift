//
//  SleepInOtherThreadVC.swift
//  GrandCentralDispatch
//
//  Created by Techmaster on 5/13/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Foundation
class SleepInOtherThreadVC: UIViewController {
    
   /* let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
   
    @IBAction func sleepButFine(_ sender: Any) {
        
        queue.async {
            print("Do something very slow here")
            sleep(5)
            print("Done")
        }
    }*/
    
    @IBAction func sleepButFine(_ sender: Any) {
        print("Do something very slow here")
        sleep(5)
        print("Done")
    }
    

    
}
