//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageOne: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    let diceImageArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func rollDiceBtn(_ sender: UIButton) {
        
        diceImageOne.image = diceImageArray.randomElement()
        
        diceImage2.image = diceImageArray.randomElement()
        
    }

}

