//
//  BasicLabel.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class BasicLabel: UIViewController {

    @IBOutlet weak var customFontLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
        setUpAttributeLabel()
    }

    func setupControl() {
        
        //Biến UILabel thành một button nhận tap
        customFontLabel.isUserInteractionEnabled = true
        customFontLabel.numberOfLines = 0
        customFontLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleTap(sender:))))
        
    }
    
    func setUpAttributeLabel() {
        let myString = "Swift Attributed String"
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.gray
        
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.blue,
                            NSAttributedString.Key.backgroundColor: UIColor.yellow,
                            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18.0)!,
                            NSAttributedString.Key.shadow: myShadow]
        
        
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        
        // set attributed text on a UILabel
        attributeLabel.attributedText = myAttrString
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("On Label Tap")
    }

}
