//
//  CustomLoginVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
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
        view.sv(
            loginFacebook
        )
        loginFacebook.width(250).height(40).centerInContainer()
        loginFacebook.addTarget(self, action: #selector(onLoginFacebookTap), for: .touchUpInside)

    }
    @objc func onLoginFacebookTap() {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withPublishPermissions: ["publish_to_groups", "publish_video"], from: self) { (loginResult, error) in
            print("Login Result")
            
            if error == nil {
                print(loginResult!.grantedPermissions)
                guard let accessToken: FBSDKAccessToken = loginResult!.token else { return }
                print (accessToken.tokenString)
                self.loginFacebook.setTitle("Logout", for: .normal)
            }
        }
       /* loginManager.logIn(publishPermissions: [.publishActions], viewController: self) { (loginResult) in
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
        }*/

    }
}
