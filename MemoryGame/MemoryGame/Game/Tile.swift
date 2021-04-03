//
//  Tile.swift
//  MemoryGame
//
//  Created by Techmaster on 3/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//  Thể hiện từng ô vuông cần lật

import Foundation
import UIKit

typealias completionHandler = (Bool) -> Void

class Tile : UIView {

    var value: Int = -1
    var frontView: UIView?
    var backView: UIView?
    
    var delegate: TileDelegate?
    
    private var isFlipped: Bool = false
    
      
    init(tag: Int, value: Int, frame: CGRect, front: UIView, back: UIView, delegate: TileDelegate) {
        super.init(frame: frame)
    
        self.tag = tag
        self.value = value
        
        self.delegate = delegate
        
        frontView = front
        backView = back
        
        frontView!.frame = self.bounds
        backView!.frame = self.bounds
        self.addSubview(backView!)
        self.addSubview(frontView!)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flip)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(value: Int) {
        if isFlipped {
            close { (_) in
                //Để đảm bảo game đúng logic thì phải đóng lại các ô đã lật rồi mới gán giá trị mới để không bị lộ
                self.value = value
                if self.backView is UILabel {
                    (self.backView as! UILabel).text = "\(value)"
                }
            }
        } else {
            self.value = value
            (self.backView as! UILabel).text = "\(value)"
        }
    }
    
    @objc func flip() {
        isFlipped = !isFlipped
        
        
        let cardToFlip = isFlipped ? frontView : backView
        let bottomCard = isFlipped ? backView : frontView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: { (_) in
                            if self.isFlipped {
                                self.delegate?.onTileFlip(tile: self)
                            }
        })
        
    }
    
    func close(completion: completionHandler? ) {
        if !isFlipped {
            return
        }
        
        isFlipped = false
        UIView.transition(from: backView!,
                          to: frontView!,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          
                          completion: completion)
        
        
    }
}
