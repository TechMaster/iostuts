//
//  ShareVC.swift
//  facebookapp
//
//  Created by Techmaster on 4/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
import FBSDKShareKit

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
        let content = FBSDKSharePhotoContent()
        let photo1 = FBSDKSharePhoto(image: UIImage(named: "OldHN"), userGenerated: true)
        photo1?.caption = "Phố Hà nội"
        let photo2 = FBSDKSharePhoto(image: UIImage(named: "ferarrio_ava"), userGenerated: true)
        photo2?.caption = "Cô gái Nga"
        content.photos = [photo1, photo2]
        FBSDKShareDialog.show(from: self, with: content, delegate: self)
    }
    
    @objc func shareVideo() {
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
