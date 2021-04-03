//
//  SmallerBVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 5/8/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class SmallerBVC: UIViewController {
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        label.text = "Demo B"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(label)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        label.center = CGPoint(x: view.bounds.size.width * 0.5,
                               y: view.bounds.size.height * 0.5)
    }
    
    
    
}
