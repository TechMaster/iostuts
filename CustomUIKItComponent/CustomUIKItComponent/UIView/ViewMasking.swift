//
//  ViewMasking.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class ViewMasking: UIViewController {
    let girl = UIImageView(image: UIImage(named: "ferarrioB"))
    let heart = UIImageView(image: UIImage(named: "heart"))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        girl.contentMode = .scaleAspectFit
   
        view.sv (
            girl
        )
        girl.width(512).height(512).centerInContainer()
        girl.mask = heart
        
        
    }
    
    override func viewDidLayoutSubviews() {
        heart.frame = CGRect(origin: CGPoint(x: 0, y: -girl.bounds.size.height), size: girl.bounds.size)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3, animations: {
            self.heart.center = CGPoint(x: self.heart.center.x, y: self.heart.center.y + self.girl.bounds.size.height*1.2)
        }) { (_) in
            UIView.animate(withDuration: 1, animations: {
                self.heart.transform = CGAffineTransform(scaleX: 3, y: 3)
            })
        }
    }

}
