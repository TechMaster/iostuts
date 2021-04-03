//
//  MyPodCastCell.swift
//  PodCastApp
//
//  Created by Techmaster on 4/16/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class MyPodCastCell: UITableViewCell {

    let leftView = PodCastView()
    let rightView = PodCastView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        self.sv(
            leftView,
            rightView
        )

        self.layout(4,
            |-8-leftView-(>=4)-rightView-8-| ~ 180,
            6
        )
        leftView.Height == rightView.Height
        leftView.Width == rightView.Width
    }
    
    func setData(dataForLeftCell: MyPodCast, dataForRightCell: MyPodCast) {
        leftView.setData(data: dataForLeftCell)
        rightView.setData(data: dataForRightCell)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
