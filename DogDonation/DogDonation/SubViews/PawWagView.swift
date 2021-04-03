//
//  PawWagView.swift
//  DogDonation
//
//  Created by Techmaster on 3/27/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia


class PawWagView: UIView {
    let pawnwag = UILabel(text: "Paws & Wags", hexcolor: 0x2a2a2b, fontface: "SofiaPro-Medium", fontsize: 25.0)
    let browseall = UILabel(text: "Browse all", hexcolor: 0xc7c7d0, fontface: "Helvetica", fontsize: 18)
    
    let AllLabel = UILabel(text: "All")
    let SmallLabel = UILabel(text: "Small")
    let MediumLabel = UILabel(text: "Medium")
    let LargeLabel = UILabel(text: "Large")

    let dogCard = DogCard(name: "Barkley", image: UIImage(named: "dogA")!, favourite: true)
    convenience init() {
        self.init(frame: CGRect.zero) // Không có lệnh này crash vỡ mặt
        
        let stackView = configureSizeSelection()
        sv(
            pawnwag,
            browseall,
            stackView,
            dogCard
        )
        layout(
            |-pawnwag-(>=30)-|, 5 ,
            |-stackView-|, 10 ,
            |-dogCard.width(170).height(230)-(>=10)-|
            
            
        )
        browseall.Right == self.safeAreaLayoutGuide.Right
        align(lastBaselines: pawnwag, browseall)
        
    }
    
    func configureSizeSelection() -> UIStackView {
        let font = UIFont(name: "SofiaPro-SemiBold", size: 20)
        
        AllLabel.font = font
        SmallLabel.font = font
        MediumLabel.font = font
        LargeLabel.font = font
        
        AllLabel.textColor = UIColor(rgb: 0x97d3ed)
        SmallLabel.textColor = UIColor(rgb: 0xdf543c)
        MediumLabel.textColor = UIColor(rgb: 0xeebb33)
        LargeLabel.textColor = UIColor(rgb: 0xd91d8b)
        
        //Sắp xếp các label theo hàng ngang, cách đều nhau
        let stackView = UIStackView(arrangedSubviews: [AllLabel, SmallLabel, MediumLabel, LargeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 35
        stackView.alignment = .leading
        
        return stackView
    }
    

}
