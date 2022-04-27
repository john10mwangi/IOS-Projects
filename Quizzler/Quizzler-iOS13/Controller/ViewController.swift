//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    
    var questionData = QuestionData()
    
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }

    @IBAction func onButtonClick(_ sender: UIButton) {
        
        if questionData.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
            
        }else {
            sender.backgroundColor = UIColor.red
            
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
            self.questionData.updateQuestionNumber()
            self.updateUi()
        })
    }
    
    func updateUi() {
        optionButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor  = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score : \(questionData.getMyScore())"
        setOptions(options: questionData.getOptions())
        questionLabel.text = questionData.getQuestionText()
        progressBar.progress = questionData.getProgress()
        timer.invalidate()
    }
    
    func setOptions(options: [String]) {
        optionButton.setTitle(options[0], for: .normal)
        trueButton.setTitle(options[1], for: .normal)
        falseButton.setTitle(options[2], for: .normal)
    }
    
}

