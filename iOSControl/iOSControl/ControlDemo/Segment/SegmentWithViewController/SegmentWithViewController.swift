//
//  SegmentWithViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/4/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class SegmentWithViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    lazy var pinkVC: PinkViewController = {
        let vc = PinkViewController()
        return vc
    }()
    
    lazy var greenVC: GreenViewController = {
       let vc = GreenViewController()
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func addViewControllerAsChildViewController(childViewController: UIViewController) {
        
    }
}
