//
//  ThemVC.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ThemVC: UIViewController {
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    var arrays = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        arrays = [UIImage(named: "bikini01"),
                  UIImage(named: "bikini02"),
                  UIImage(named: "bikini03"),
                  UIImage(named: "bikini04")] as! [UIImage]
        
        view.addSubview(scrollView)
        addImage(arrays)

    }
    func addImage(_ images: [UIImage]){
        for i in 0..<arrays.count{
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = images[i]
            
                       let xPosition = UIScreen.main.bounds.width * CGFloat(i)
                        imageView.frame = CGRect(x: xPosition, y: 20, width: scrollView.frame.width, height: scrollView.frame.height - 72)
                       scrollView.contentSize.width = scrollView.frame.width * CGFloat(i+1)
            
           // let yPosition = UIScreen.main.bounds.height * CGFloat(i)
           // imageView.frame = CGRect(x: 0, y: yPosition, width: scrollView.frame.width, height: //scrollView.frame.height)
           // scrollView.contentSize.height = scrollView.frame.height * CGFloat(i+1)
            scrollView.addSubview(imageView)
        }
    }
}
