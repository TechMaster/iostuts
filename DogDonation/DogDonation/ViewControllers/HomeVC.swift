//
//  HomeVC.swift
//  DogDonation
//
//  Created by Techmaster on 3/27/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class HomeVC: UIViewController {

    let pawwagView = PawWagView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv (
            pawwagView
        )
        
        view.layout(
            |-pawwagView.height(100)-|
        )
        pawwagView.Top == view.safeAreaLayoutGuide.Top + 4
        pawwagView.height(view.bounds.height * 0.3)
    }
}
