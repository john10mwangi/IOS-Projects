//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: {_ in
            self.playSound(noteName: sender.currentTitle!);
            sender.alpha = 1
        })
//        playSound(noteName: sender.currentTitle!)
    }
    
    func playSound(noteName: String) {
        let url = Bundle.main.url(forResource: noteName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
