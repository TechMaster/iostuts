//
//  MainScreen.swift
//  BarCodeRS
//
//  Created by Techmaster on 4/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class MainScreen: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
    
    let button = UIButton(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        button.backgroundColor = UIColor.gray
        
        view.sv(button)
        button.setTitle("Scan Barcode", for: .normal)
        button.width(140).height(50).centerInContainer()
        button.addTarget(self, action: #selector(showBarCodeScanner), for: .touchUpInside)
 
    }
    
    @objc func showBarCodeScanner() {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        
        present(viewController, animated: true, completion: nil)
    }
    
    func scanner(_ controller: BarcodeScannerViewController,
                 didCaptureCode code: String,
                 type: String)
    {
        print("type = \(type), code = \(code)")
        //controller.reset()
        
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error)
    {
        print(error)
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        // Code processing
        controller.dismiss(animated: true, completion: nil)
    }

}
