//
//  Foo.swift
//  BootStrap
//
//  Created by Techmaster on 3/20/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class Foo: UIViewController {

    convenience init() {
        self.init(nibName: "Foo", bundle: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
