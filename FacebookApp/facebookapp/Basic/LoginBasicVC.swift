//
//  LoginBasicVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
class LoginBasicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        let loginButton = LoginButton(publishPermissions: [.publishActions])
     
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
}

extension LoginBasicVC : LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("Did complete login via LoginButton with result \(result)")
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Did logout via LoginButton")
    }
}
