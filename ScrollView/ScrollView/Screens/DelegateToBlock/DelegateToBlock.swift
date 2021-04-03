//
//  DelegateToBlock.swift
//  ScrollView
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class DelegateToBlock: UIViewController {

    @IBOutlet weak var scrollviewAbove: ScrollViewBlock!
    @IBOutlet weak var scrollviewBelow: ScrollViewBlock!
    
    @IBOutlet weak var photoAbove: UIImageView!
    @IBOutlet weak var photoBelow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollviewAbove.delegate =  scrollviewAbove
        scrollviewAbove.viewForZooming = viewForZoomAbove
        
        scrollviewBelow.delegate = scrollviewBelow
        
        //Cách 1: gán một hàm xử lý vào thuộc tính viewForZooming
        //scrollviewBelow.viewForZooming = viewForZoomBelow
        
        //Cách 2: tạo một closure rồi gán vào
        scrollviewBelow.viewForZooming = {() -> UIView? in
            return self.photoBelow
        }
        
    }
    
    func viewForZoomAbove() -> UIView? {
        return photoAbove
    }
    
    /* Cho cách 1
    func viewForZoomBelow() -> UIView? {
        return photoBelow
    }*/


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
