//
//  ViewController.swift
//  ChessBoard
//
//  Created by Techmaster on 3/18/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
enum GameMode {
    case butterfly
    case spiral
}

enum Direction {
    case Right
    case Left
    case Up
    case Down
}

enum RotateDirection {
    case CloseWise
    case CounterCloseWise
}

class ViewController: UIViewController {

    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    var squareWidth: CGFloat = 0
    var margin: CGFloat = 4.0
    var timer : Timer!
    
    let queen = UIImageView(image: UIImage(named: "queen"))
    let max = 7 //Kích thước của bàn cờ nếu tính dòng, hàng đầu tiên là 0
    var i: Int = 0 // vị trí của queen theo hàng (row)
    var j: Int = 0 // vị trí của queen theo cột (column)
    
    //Dành cho logic hàm xoáy trôn ốc
    var xLeft, xRight, yTop, yBottom: Int!
    var direction: Direction!
    var stackPos: Stack!
    var queenMove: RotateDirection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControl()
        setupGame(gameMode: .spiral)
    }
    
    func setupGame(gameMode: GameMode) {
        var animateFunc: Selector
        switch gameMode {
            case .butterfly:
                animateFunc = #selector(butterflyLoop)
            case .spiral:
                xLeft = 0
                xRight = max
                yTop = 0
                yBottom = max
                direction = .Right
                stackPos = Stack()
                queenMove = .CloseWise
                animateFunc = #selector(spiralLoop)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: animateFunc, userInfo: nil, repeats: true)

    }
    
    @objc func spiralLoop(){
        highlight(row: i, col: j)
        if queenMove == .CloseWise {
            switch direction! {
            case .Right:
                if j < xRight {
                    j += 1
                } else {
                    i += 1
                    direction = .Down
                    yTop += 1
                }
            case .Left:
                if j > xLeft {
                    j -= 1
                } else {
                    i -= 1
                    direction = .Up
                    yBottom -= 1
                }
            case .Up:
                if i > yTop {
                    i -= 1
                } else {
                    j += 1
                    direction = .Right
                    xLeft += 1
                }
            case .Down:
                if i < yBottom {
                    i += 1
                } else {
                    j -= 1
                    direction = .Left
                    xRight -= 1
                }
            }
            stackPos.push((row: i, col: j))
            if xLeft == xRight && yBottom == yTop {
                queenMove = .CounterCloseWise
            }
        } else {
            if !stackPos.isEmpty {
                (i, j) = stackPos.pop()!
            } else {
                i = 0
                j = 0
                queenMove = .CloseWise
                xLeft = 0
                xRight = max
                yTop = 0
                yBottom = max
                direction = .Right
            }
        }
        
        
        moveQueen(row: i, col: j)
       

        
    }
    
    @objc func butterflyLoop(){
        highlight(row: i, col: j)
        //Cánh bướm
        if i < max && j == 0{
            i += 1
        }else if i + j == max && i <= max && j < max {
            j += 1
            i -= 1
        }else if i < max && j == max{
            i += 1
        }else if i == j {
            i -= 1
            j -= 1
        }
        moveQueen(row: i, col: j)
    }
    
    func setUpControl() {
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        squareWidth = (self.view.bounds.width - margin * 2.0) / CGFloat(max + 1)
        self.view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        
        for row in 0...max{
            for col in 0...max {
                let isWhiteSquare = (row + col) % 2 == 1 ? true: false
                drawSquare(isWhite: isWhiteSquare, row: row, col: col)
            }
        }
        
        placeQueen(isWhite: true, row: 0, col: 0)
        print(view.subviews.count)
    }
    
   
    func drawSquare(isWhite: Bool, row: Int, col: Int) {
        
        let topleft = computeTopLeftPosition(row: row, col: col, width: squareWidth)
        
        let square = UIView(frame: CGRect(x: topleft.x, y: topleft.y, width: squareWidth, height: squareWidth))
        
        square.backgroundColor = isWhite ? UIColor.white : UIColor.black
        self.view.addSubview(square)
    }
    
    func placeQueen(isWhite: Bool, row: Int, col: Int) {
        queen.contentMode = .scaleAspectFit
        self.view.addSubview(queen)
        moveQueen(row: row, col: col)
    }
    
    func moveQueen(row: Int, col: Int) {
        let topleft = computeTopLeftPosition(row: row, col: col, width: squareWidth)
        queen.frame = CGRect(x: topleft.x, y: topleft.y, width: squareWidth, height: squareWidth)
    }
    
    func computeTopLeftPosition(row: Int, col: Int, width: CGFloat) -> (x: CGFloat, y: CGFloat) {
        return (margin + CGFloat(col) * width, 100 + CGFloat(row) * width)
    }
    
    //Tính tọa độ để đối tượng có kích thước inner_width nằm đồng tâm với khung vuông width
    func computeTopLeftPosition(row: Int, col: Int, width: CGFloat, inner_width: CGFloat) -> (x: CGFloat, y: CGFloat) {
        let adjust = (width - inner_width) * 0.5
        return (margin + CGFloat(col) * width + adjust,
                100 + CGFloat(row) * width + adjust)
    }
    
    
    /*
     Hiển thị một hình tròn màu hồng ở giữa tâm của ô bàn cờ, sau đó mờ dần rồi biến mất
    */
    func highlight(row: Int, col: Int) {
        let diameter = squareWidth * 0.7
        let topleft = computeTopLeftPosition(row: row, col: col, width: squareWidth, inner_width: diameter)
        
        let redcircle = UIView(frame: CGRect(x: topleft.x, y: topleft.y, width: diameter, height: diameter))
        
        
        redcircle.backgroundColor = UIColor.red
        redcircle.alpha = 0.5
        redcircle.layer.cornerRadius = 0.5 * diameter
        view.addSubview(redcircle)
        UIView.animate(withDuration: 1.2, animations: {
            redcircle.alpha = 0.0
            redcircle.bounds = CGRect(x: 0, y: 0, width: diameter * 0.2, height: diameter * 0.2)
        }) { (_) in
            redcircle.removeFromSuperview()
        }
        
    }

}
