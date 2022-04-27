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
    var audioPlayer: AVAudioPlayer?
    var timer = Timer()
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 0.05, "Medium": 0.1, "Hard": 0.15]
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        progressBar.progress = 0
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        let hardness = sender.currentTitle!
        
        cookFor(cookTime: Double(eggTimes[hardness]!))
        
    }
    
    func cookFor(cookTime: Double){
        var duration = cookTime*60
        let stdDuratation = cookTime*60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block : {_ in
            duration=duration-1
            if duration >= 0{
                var progress = stdDuratation-duration
                self.progressBar.progress = Float(progress/stdDuratation)
                print(duration)
            }else{
                self.timer.invalidate()
                self.titleLabel.text = "Eggs are done cooking"
                self.playSound()
            }
        })
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = audioPlayer else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
