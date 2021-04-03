//
//  ScrollViewBlock.swift
//  ScrollView
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ScrollViewBlock: UIScrollView, UIScrollViewDelegate {        
    var viewForZooming: (() -> UIView?)? = nil
    /*
     Hàm hứng sự kiện viewForZooming(in scrollView: UIScrollView) xịn của UIViewScrollViewDelegate
     Nó sẽ trả về hàm sẽ được gán vào thuộc tính viewForZooming của UIScrollView
    */
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewForZooming != nil ? viewForZooming!() : nil
    }
}
