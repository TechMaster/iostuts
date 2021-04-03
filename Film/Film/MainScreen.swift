//
//  MainScreen.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class MainScreen: UIViewController {
    let topActorScroll = TopActorScroll()
    let filmBoard = FilmBoard()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        view.sv(topActorScroll, filmBoard)
        topActorScroll.Top == view.safeAreaLayoutGuide.Top
        
        view.layout(
            |-topActorScroll-|,
            5,
            |-(-3)-filmBoard-(-3)-|,
            0
        )
        topActorScroll.Height == filmBoard.Height / 3.5
     
    }
}
