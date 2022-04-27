//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var storyBrain = StoryBrain()

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoice1().text, for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2().text, for: .normal)
    }


    @IBAction func onButtonClicked(_ sender: UIButton) {
        storyBrain.onClick(sender.currentTitle!)
        updateUI()
    }
}

