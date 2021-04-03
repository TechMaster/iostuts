//
//  ViewController.swift
//  DemoTimer
//
//  Created by Techmaster on 4/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBOutlet weak var waterLevel: UIView!
    
    var gameTimer: Timer!
    let countDownBanDau: Int = 30
    var countDown: Int = 0
    var y: CGFloat = 0
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(countDown)
        countDown = countDownBanDau
       
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(runTimeCode),
                                         userInfo: nil,
                                         repeats: true)
        
        waterLevel.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
       
    }
    
    @objc func runTimeCode() {
        countDown = countDown - 1
        if countDown == 0 {
            gameTimer.invalidate()
            playSound(soundName: "WaterBubbling", fileExtension: "wav")
            
        }
        y = y + self.view.bounds.height / CGFloat(countDownBanDau)
        countDownLabel.text = String(countDown)
        waterLevel.frame = CGRect(x: 0, y: y, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    func playSound(soundName: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: fileExtension) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }


}

