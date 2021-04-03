//
//  ViewController.swift
//  MemoryGame
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//  GameManager sẽ khởi tạo Board rồi trả về đối tượng Board. Trong Board có nhiều Tile
//  GameManager sẽ chứa vòng lặp game, timerLoop

import UIKit
import Stevia

class MainScreen: UIViewController, TileDelegate {
    var board = Board.init(rows: 3, cols: 2)
    let margin: CGFloat = 12
    
    var countDownClock = CountDownClock(size: CGSize(width: 120, height: 120))
    
    var previousOpenTile: Tile? = nil
    
    var point: Int = 0 //Khi point bằng tổng số tile thì người chơi thắng
    var flipCount: Int = 0 //Số lần người chơi đã lật tile kể cả lần thành công hoặc thất bại
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.tileDelegate = self
        countDownClock.onTimeOut =  {()-> Void in
            
            let alert = UIAlertController(title: "Đã hết giờ", message: "Bạn đã thua", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Chơi tiếp", style: .default, handler: {(_) in
                self.board.shuffleBoard()
                self.startNewGame()
            }))
            self.present(alert, animated: true)
        }
        
        view.backgroundColor = UIColor.white
        view.sv(board, countDownClock)
        board.Top == view.safeAreaLayoutGuide.Top + margin
       
        view.layout(
            |-margin-board-margin-|,
            (<=10),
            countDownClock,
            (<=20)
        )
        board.backgroundColor = UIColor.gray
        
        countDownClock.width(120.0).height(120.0).centerHorizontally()
       // print(board.frame)  // (0.0, 0.0, 0.0, 0.0)
        
    }
    
    override func viewDidLayoutSubviews() {
       // print(board.frame)  //
        board.constructBoard(size: board.bounds.size)
    }
    
    func startNewGame() {
        //Nếu board có sẵn rồi thì thôi, chưa có thì khởi tạo Board mới
        point = 0
        flipCount = 0
        countDownClock.start(timeoutInSec: 30)
    }

    func onTileFlip(tile: Tile) {
        print("\(tile.tag) - \(tile.value)")
        
        if flipCount == 0 {
            startNewGame()
        }
        
        flipCount += 1
        
        if previousOpenTile == nil {  //Bắt đầu lật mới một title
            previousOpenTile = tile
        } else {
            if previousOpenTile?.value != tile.value { //Hai tile không giống nhau
                previousOpenTile?.close(completion: nil)
                tile.close(completion: nil)
            } else { //Hai tile giống nhau, cộng 2 điểm cho người chơi.
                point += 2
                if point == board.rows * board.cols {
                    onPlayerWin()
                }
            }
            previousOpenTile = nil
        }
        
    }
    
    func onPlayerWin() {
        countDownClock.stop()
        
        let alert = UIAlertController(title: "Xin chúc mừng", message: "Bạn đã dành chiến thắng", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Chơi tiếp", style: .default, handler: {(_) in
                self.board.shuffleBoard()
                self.startNewGame()
            }
        ))
        
    
        self.present(alert, animated: true)
    }

}
