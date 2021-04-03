//
//  ShareVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
import FacebookShare

import FBSDKShareKit
class ShareVC: UIViewController {
    let btnShareLink = RoundButton(title: "Share Link", rgbColor: 0x39589b, cornerRadius: 3.0)
    let btnSharePhoto = RoundButton(title: "Share Photo", rgbColor: 0x39589b, cornerRadius: 3.0)
    let btnShareVideo = RoundButton(title: "Share Video", rgbColor: 0x39589b, cornerRadius: 3.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let stackView = UIStackView(arrangedSubviews: [btnShareLink, btnSharePhoto, btnShareVideo])
        btnShareLink.width(200).height(30)
        btnSharePhoto.width(200).height(30)
        btnShareVideo.width(200).height(30)
        
        btnShareLink.addTarget(self, action: #selector(shareLink), for: .touchUpInside)
        btnSharePhoto.addTarget(self, action: #selector(sharePhoto), for: .touchUpInside)
        btnShareVideo.addTarget(self, action: #selector(shareVideo), for: .touchUpInside)
        
        view.sv(stackView.width(200).height(300))
        stackView.centerInContainer()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
    }
    
    @objc func shareLink() {
       
        let content = FBSDKShareLinkContent()
        content.contentURL = URL(string: "https://techmaster.vn/")
        FBSDKShareDialog.show(from: self, with: content, delegate: self)
   
    }
    
    @objc func sharePhoto() {
    }
    
    @objc func shareVideo() {
    }
    
    
    func share<C: ContentProtocol>(_ content: C) {
        var title: String = ""
        var message: String = ""
        
        do {
            try GraphSharer.share(content) { result in
                switch result {
                case .success(let contentResult):
                    title = "Share Success"
                    message = "Succesfully shared: \(contentResult)"
                case .cancelled:
                    title = "Share Cancelled"
                    message = "Sharing was cancelled by user."
                case .failed(let error):
                    title = "Share Failed"
                    message = "Sharing failed with error \(error)"
                }
                //let alertController = UIAlertController(title: title, message: message)
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        } catch {
            title = "Share API Fail"
            message = "Failed to invoke share API with error: \(error)"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
        }
    }



}

extension ShareVC:FBSDKSharingDelegate {
    func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable : Any]!) {
        print(results)
    }
    
    func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
        print(error)
    }
    
    func sharerDidCancel(_ sharer: FBSDKSharing!) {
        print("Share cancel")
    }
    
    
}
