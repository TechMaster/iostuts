//
//  ColorButtonVC.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class ColorButtonVC: UIViewController {
    let signUpFacebook = RoundButton(title: "Signup with Facebook", rgbColor: 0x39589b, cornerRadius: nil)
    let signUpGooogle = RoundButton(title: "Signup with Google", rgbColor: 0xf34836, cornerRadius: 10)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(
            signUpFacebook,
            signUpGooogle
        )
        signUpFacebook.width(250).height(40).centerHorizontally()
        signUpGooogle.width(250).height(40).centerHorizontally()
        signUpGooogle.Top == signUpFacebook.Bottom + 20
        signUpGooogle.Bottom == view.safeAreaLayoutGuide.Bottom - 100
    }
    

}
