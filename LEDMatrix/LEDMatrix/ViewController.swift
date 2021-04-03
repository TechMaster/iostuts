//
//  ViewController.swift
//  LEDMatrix
//
//  Created by Techmaster on 3/18/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ballSize:CGFloat = 10.0
    var rows: Int = 0 //rows of LED ball
    var cols: Int = 0 //cols of LED ball
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var margin: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
        //drawCharacter(dotChar: dotCharDic["3"]!, x: 0, y: 0)
        drawString(string: "Hello", x: 8, y: 5)
        drawString(string: "World", x: 8, y: 15)
        
    }
    
    func computeSizeOfLedPanel() -> (rows: Int, cols: Int) {
        return (0, 0)
    }
    
    func setupControl() {
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        self.view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1   )
         
        //Cần phải giải phương trình này để tìm ra giá trị cols tối ưu
        //screenWidth = cols * ballSize + (cols + 1) * margin
        //screenWidth = cols * (ballSize + margin) + margin
        cols = Int((screenWidth - margin) / (ballSize + margin))
        
        rows = Int((screenHeight - margin) / (ballSize + margin))
        
        print("rows = \(rows), cols = \(cols)")
        for row in 0..<rows {
            for col in 0..<cols {
                drawBallAt(isGreen: false, row: row, col: col)
            }
        }
    }
    
    func genTagForLED(row: Int, col: Int) -> Int {
        return 100 + row * cols + col
    }
    func drawBallAt(isGreen: Bool, row: Int, col: Int) {
        let ball = UIImageView(image: UIImage(named: isGreen ? "greenball": "grayball"))
        ball.contentMode = .scaleAspectFit
        ball.frame = CGRect(x: margin + CGFloat(col) * (ballSize + margin),
                            y: margin + CGFloat(row) * (ballSize + margin),
                            width: ballSize,
                            height: ballSize)
        
        ball.tag = genTagForLED(row: row, col: col)
        
        self.view.addSubview(ball)
    }
    
    func switchLed(isOn: Bool, row: Int, col: Int) {
        guard let ball = self.view.viewWithTag(genTagForLED(row: row, col: col)) as? UIImageView else {
            return
        }
        ball.image = UIImage(named: isOn ? "greenball": "grayball")
    }
    
    
    func drawCharacter(dotChar: UInt64, x: Int, y: Int) {
        var binString: String = String(dotChar, radix: 2)
        // Chú ý binString có thể có <= 64, do các số 0
        let paddingZero = String(repeating: "0", count: 64 - binString.count)
        binString = paddingZero + binString
   
        //Debug to console
        /*for row in 0..<8 {
            for col in 0..<8 {         
                let char = binString[63 - row * 8 - col]
                print("\(char)", separator: "", terminator: "")
            }
            print("")
        }*/
        for row in 0..<8 {
            for col in 0..<8 {
                let char = binString[63 - row * 8 - col]
                switchLed(isOn: char=="1" ? true: false, row: y + row, col: x + col)
            }
        }
    }
    
    func drawString(string: String, x: Int, y: Int) {
        for (i, char) in string.enumerated() {            
            drawCharacter(dotChar: dotCharDic[char]!, x: x + i * 8, y: y)
        }
    }

}

