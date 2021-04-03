//
//  FilmBoard.swift
//  Film
//
//  Created by Techmaster on 3/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class FilmBoard: UIScrollView {
    var tvshow: FilmScroll!
    var trending_now: FilmScroll!
    var available: FilmScroll!
    convenience init() {
        self.init(frame: CGRect.zero)
        tvshow = FilmScroll(title: "US TV Shows", images: ["birds", "blade_runner", "clock_work_orange", "dance_with_woves", "jurassic_world", "planes_of_apes", "pulp_piction", "solaris"])
        
        trending_now = FilmScroll(title: "Trending Now", images: ["ET", "god_father", "into_the_wild", "jaws", "jurassick_park", "kong_skull_island", "shape_of_water"])
        
        available =  FilmScroll(title: "Available", images: ["greatest_show_man", "27dress", "tomb_raider", "black_man", "shape_of_water"])
      
        self.addSubview(tvshow)
        self.addSubview(trending_now)
        self.addSubview(available)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //Đảm bảo có 2 scroll view và một phần label của scroll view thứ 3 trong vùng nhìn được
        let filmscroll_height = (self.bounds.height - 50)/2 //Chừa ra một đoạn 50 pixel để label scrollview 3 trồi lên
        for (i, filmscroll) in self.subviews.enumerated(){
            filmscroll.frame = CGRect(x: 0,
                                      y: CGFloat(i) * (filmscroll_height + 4.0),
                                      width: self.bounds.width,
                                      height: filmscroll_height)
            
        }
        self.contentSize = CGSize(width: self.bounds.width, height: CGFloat(self.subviews.count) * (filmscroll_height + 4.0))
        
    }

}
