//
//  MainScreen.swift
//  EightQueenProblem
//
//  Created by Techmaster on 4/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var chessBoard: ChessBoard!
    var chess_size: Int = 8
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
    }
    override func viewDidLayoutSubviews() {
    
        super.viewDidLayoutSubviews()
        
        let min_width = CGFloat.minimum(view.bounds.size.width, view.bounds.size.height)
        if chessBoard != nil {
            chessBoard.removeFromSuperview()
            
        }
        if view.bounds.size.width < view.bounds.size.height {
            
            chessBoard = ChessBoard(frame: CGRect(x: 0,
                                                      y: (view.bounds.size.height - view.bounds.size.width) * 0.5 - 100,
                                                      width: min_width,
                                                      height: min_width),
                                        size: chess_size)
        } else {
            chessBoard = ChessBoard(frame: CGRect(x: (view.bounds.size.width - view.bounds.size.height) * 0.5 - 100,
                                                  y: 0,
                                                  width: min_width,
                                                  height: min_width),
                                    size: chess_size)

            
        }
        
        
        view.addSubview(chessBoard)
        
    }
    

}
