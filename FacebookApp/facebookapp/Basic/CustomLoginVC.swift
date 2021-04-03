//
//  CustomLoginVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
import FacebookLogin
import FacebookCore

class CustomLoginVC: UIViewController {
    let loginFacebook = RoundButton(title: "Login with Facebook", rgbColor: 0x39589b, cornerRadius: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(
            loginFacebook
        )
        loginFacebook.width(250).height(40).centerInContainer()
        loginFacebook.addTarget(self, action: #selector(onLoginFacebookTap), for: .touchUpInside)

    }
    @objc func onLoginFacebookTap() {
        let loginManager = LoginManager()

        loginManager.logIn(publishPermissions: [.publishActions], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print("Granted Permissions: \(grantedPermissions)")
                print("Declined Permissions: \(declinedPermissions)")
                print("Access Token: \(accessToken)")
                self.loginFacebook.setTitle("Login successfully", for: .normal)
                
            }
        }

    }
}
