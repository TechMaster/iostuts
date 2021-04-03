//
//  BigFatVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 5/8/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//  Ví dụ này demo một ViewController có thể chứa ViewController nhỏ hơn trong cùng một màn hình

import UIKit

class BigFatVC: UIViewController {
    let avc = SmallerAVC()
    let bvc = SmallerBVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let topmargin: CGFloat = 60
        avc.view.frame = CGRect(x: 0,
                                y: topmargin,
                                width: view.bounds.size.width,
                                height: (view.bounds.size.height - topmargin) * 0.5)
        
        bvc.view.frame = CGRect(x: 0,
                                y: topmargin + (view.bounds.size.height - topmargin) * 0.5 ,
                                width: view.bounds.size.width,
                                height: (view.bounds.size.height - topmargin) * 0.5)
        
        view.addSubview(avc.view)
        view.addSubview(bvc.view)
    }
    



}
