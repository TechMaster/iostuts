//
//  EventsCycleVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 5/8/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class EventsCycleVC: UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    



}
