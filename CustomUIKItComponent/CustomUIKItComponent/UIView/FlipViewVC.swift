//
//  FlipViewVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class FlipViewVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
   
    

    var flipView: FlipView?

    var flipStyle  = UIPickerView()
    let styleOptions = ["Flip From Left", "Flip From Right", "Curl Up", "Curl Down", "Cross Dissolve", "Flip From Top", "Flip From Bottom"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let frontView = UIImageView(image: UIImage(named: "ferarrioA"))
        frontView.contentMode = .scaleAspectFit
        
        let backView = UIImageView(image: UIImage(named: "ferarrioB"))
        backView.contentMode = .scaleAspectFit
        
        let width:CGFloat = 300, height:CGFloat = 400
        flipView = FlipView(size: CGSize(width: width, height: height), front: frontView, back: backView)
        
        flipStyle.delegate = self
        flipStyle.dataSource = self
        
        view.sv(
            flipView!,
            flipStyle
        )

        flipView!.Top == view.safeAreaLayoutGuide.Top + 8.0
        view.layout(
            flipView!.width(width).height(height).centerHorizontally(),
            flipStyle.centerHorizontally()
        )
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return styleOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {        
        return styleOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            flipView?.flipStyleOption = .transitionFlipFromLeft
        case 1:
            flipView?.flipStyleOption = .transitionFlipFromRight
        case 2:
            flipView?.flipStyleOption = .transitionCurlUp
        case 3:
            flipView?.flipStyleOption = .transitionCurlDown
        case 4:
            flipView?.flipStyleOption = .transitionCrossDissolve
        case 5:
            flipView?.flipStyleOption = .transitionFlipFromTop
        case 6:
            flipView?.flipStyleOption = .transitionFlipFromBottom
        default:
            flipView?.flipStyleOption = .transitionFlipFromLeft
        }
    }


}
