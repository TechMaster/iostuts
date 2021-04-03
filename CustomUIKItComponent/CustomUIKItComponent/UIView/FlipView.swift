//
//  FlipView.swift
//  CustomUIKItComponent
//
//  Created by Techmaster on 3/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class FlipView: UIView {

    var frontView: UIView?
    var backView: UIView?
    private var isFlipped: Bool = false
    var flipStyleOption: UIView.AnimationOptions = .transitionFlipFromLeft
    
    init(size: CGSize, front: UIView, back: UIView) {
        super.init(frame: CGRect.zero)
        frontView = front
        backView = back
        frontView?.frame = CGRect(origin: CGPoint.zero, size: size)
        backView?.frame = CGRect(origin: CGPoint.zero, size: size)
        
        
        addSubview(backView!)
        addSubview(frontView!)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flip)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func flip() {
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? frontView : backView
        let bottomCard = isFlipped ? backView : frontView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                           options: [flipStyleOption, .showHideTransitionViews],
            
            completion: nil)

    }
    

    
}
