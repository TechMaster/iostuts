//
//  CustomLoginVC.swift
//  BrotherVietnam
//
//  Created by Techmaster on 4/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
import FBSDKLoginKit

class CustomLoginVC: UIViewController {
    let loginFacebook = RoundButton(title: "Login with Facebook", rgbColor: 0x39589b, cornerRadius: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.sv(loginFacebook)
        loginFacebook.width(250).height(40).centerInContainer()
        loginFacebook.addTarget(self, action: #selector(onLoginFacebookTap), for: .touchUpInside)
    }
    @objc func onLoginFacebookTap() {
        //print("Login")
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withPublishPermissions: ["publish_to_groups", "publish_video"], from: self) { (loginResult, error) in
            if error == nil {
                print(loginResult!.grantedPermissions)
                guard let accessToken: FBSDKAccessToken = loginResult!.token else { return }
                print (accessToken.tokenString)
                self.loginFacebook.setTitle("Logout", for: .normal)
            } else {
                print(error)
            }
        }
    }


}
