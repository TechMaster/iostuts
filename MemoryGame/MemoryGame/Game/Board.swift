//
//  Board.swift
//  MemoryGame
//
//  Created by Techmaster on 3/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//  Chứa mảng 2 chiều các Tile, ô vuông cần lật

import UIKit

class Board: UIView {
    var rows: Int = 0
    var cols: Int = 0
    weak var tileDelegate: TileDelegate?
    
    let margin: CGFloat = 8.0
    let viewTagStart = 9999
    
    
    // Nếu truyền vào cả rows và cols là số lẻ hãy throw
    convenience init(rows: Int, cols: Int) {
        self.init()
        self.rows = rows
        self.cols = cols
    }
    
    func shuffleData() -> [Int] {
        let n = 8
        var data = [Int](repeating: 0, count: rows * cols)
        
        let halfCount = data.count/2
        
        for i in 0..<halfCount {
            let genNum = (i <= n) ? i : Int.random(in: 0...n)
            data[i] = genNum
            data[i+halfCount] = genNum
        }
        
        //Swap two random cells array number of times
        for _ in 0...data.count/2 {
            let i = Int.random(in: 0..<data.count)
            let j = Int.random(in: 0..<data.count)
            if i != j {
                let temp = data[i]
                data[i] = data[j]
                data[j] = temp
            }
            
        }
        func debug() {
            for row in 0..<rows {
                for col in 0..<cols {
                    print("\(data[row * cols + col]) ",terminator: "")
                }
                print("")
            }
        }
        
        debug()
        
        return data
    }
    //Pass in board side that we get in event viewDidLayoutSubviews
    func constructBoard(size: CGSize) {
        let width = (size.width - CGFloat(cols + 1) * margin) / CGFloat(cols)  //width of tile
        let height  = (size.height - CGFloat(rows + 1) * margin ) / CGFloat(rows) //height of tile
        
        let data = shuffleData()
        
        for row in 0..<rows {
            for col in 0..<cols {
                let index = row * cols + col
                let value = data[index]
                let label = createLabel(value: value)
                
                
                let frontView = UIView()
                frontView.backgroundColor = UIColor(red:0.25, green:0.44, blue:0.72, alpha:1.0)
                
                let tile = Tile(tag: viewTagStart + index,
                                value: value,
                                frame: CGRect(x: margin + CGFloat(col) * (margin + width),
                                                            y: margin + CGFloat(row) * (margin + height), width: width, height: height),
                                front: frontView,
                                back: label,
                                delegate: tileDelegate!)
                
                self.addSubview(tile)
           
            }
        }
    }
    
    //Sử dụng để tạo dữ liệu random mới cho board chuẩn bị màn chơi mới
    func shuffleBoard() {
        let data = shuffleData()
        for row in 0..<rows {
            for col in 0..<cols {
               let index = row * cols + col
               let tile = self.viewWithTag(viewTagStart + index) as! Tile
               tile.setValue(value: data[index])
                
            }
        }
    }
    
    func createLabel(value: Int) -> UILabel {
        let label = UILabel()
        label.text = "\(value)"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 48.0)
        return label
    }
    
    

}
