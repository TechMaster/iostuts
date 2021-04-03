//
//  ChessBoard.swift
//  EightQueenProblem
//
//  Created by Techmaster on 4/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ChessBoard: UIView {
    let margin: CGFloat = 2.0
    var size: Int!
    convenience init(frame: CGRect, size: Int) {
        self.init(frame: frame)
        self.size = size
    }
    
    func drawSquare(isWhite: Bool, width: CGFloat, row: Int, col: Int) {
        //Hàm có thể định nghĩa bên trong hàm khác
        func computePositionOfSquare(row: Int, col: Int, squareWidth: CGFloat) -> CGRect {
            return CGRect(x: margin + CGFloat(col) * squareWidth, y:  margin + CGFloat(row) * squareWidth, width: squareWidth, height: squareWidth)
        }
        
        let cell = CAShapeLayer()
    
        
        cell.path = UIBezierPath(rect:  computePositionOfSquare(row: row, col: col, squareWidth: width)).cgPath
        cell.fillColor = (isWhite ? UIColor.white : UIColor.black).cgColor
        layer.addSublayer(cell)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let screenWidth = CGFloat.minimum(rect.size.width, rect.size.height)
        
        let squareWidth = (screenWidth - margin * 2.0) / CGFloat(size)
        backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        
        for row in 0..<size {
            for col in 0..<size {
                let isWhiteSquare = (row + col) % 2 != 1 ? true: false
                drawSquare(isWhite: isWhiteSquare, width: squareWidth, row: row, col: col)
            }
        }

    }
    

}
