//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Float] = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    func reset(hardness: String) {
        timer.invalidate()
        progressBar.progress = 0
        labelTitle.text = hardness
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3" ) else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        reset(hardness: hardness)
        
  
        let targetTime: Float = eggTimes[hardness]!
        var count: Float = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if count < targetTime {
                count += 1
                self.progressBar.progress = count / targetTime
            } else {
                Timer.invalidate()
                self.labelTitle.text = "done"
                self.playSound()
            }
            
            
        }
        
    }
    

}
