//
//  UpdateUIFromOtherThreadVC.swift
//  GrandCentralDispatch
//
//  Created by Techmaster on 5/13/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class UpdateUIFromOtherThreadVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateUITheBadWay(_ sender: Any) {
        queue.async {
            for i in 1...5 {
                sleep(1)
                self.label.text = "\(i)"
            }
        }
    }
    @IBAction func updateUITheGoodWay(_ sender: Any) {
        queue.async {
            for i in 1...5 {
                sleep(1)
                DispatchQueue.main.async {  /// Bổ xung thêm lệnh cập nhật giao diện bên trong main queue
                    self.label.text = "\(i)"
                }                
            }
        }
    }
    
}
