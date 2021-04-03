//
//  TopActorScroll.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class TopActorScroll: UIScrollView {
    var stackView : UIStackView!
    var actors: [TopActorView]!
    convenience init() {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.black
        actors = [
            TopActorView(name: "Fighter Club\n Brad Pitt", photo_name: "brad_pit"),
            TopActorView(name: "Pretty Woman\nJulia Robert", photo_name: "julia_robert"),
            TopActorView(name: "A Star Is Born\nBradley Coper", photo_name: "bradley_coper"),
            TopActorView(name: "Aqua man\nAmber Heart", photo_name: "amber_heart")
        ]
        
        stackView = UIStackView(arrangedSubviews: actors)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 0.0
        self.contentInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        let content_width = CGFloat(actors.count) * (self.bounds.height - 2 * margin)
        self.contentSize = CGSize(width: CGFloat(content_width), height: self.bounds.height - 2 * margin)
        self.stackView.frame = CGRect(origin: CGPoint(x: margin, y: margin), size: self.contentSize)
    }
}
