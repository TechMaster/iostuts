//
//  LoginBasicVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginBasicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        let loginButton = FBSDKLoginButton(frame: CGRect.zero)
        // Danh sách các permission https://developers.facebook.com/docs/facebook-login/permissions/
        loginButton.publishPermissions = ["publish_to_groups", "publish_video"]
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }
}

extension LoginBasicVC : FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
}
