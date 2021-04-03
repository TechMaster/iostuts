//
//  ViewController.swift
//  IAmRich
//
//  Created by Techmaster on 3/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ruby: UIImageView!
    
    @IBOutlet weak var iamrich: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ruby.alpha = 0.0
        iamrich.center = CGPoint(x: view.center.x, y: view.bounds.height + 100)
        
        //------------
        UIView.animate(withDuration: 3, animations: {
            self.ruby.alpha = 1.0
            self.iamrich.center = CGPoint(x: self.view.center.x, y: self.view.bounds.height - 150)
        }) { (_) in
            
        }
    }
}

