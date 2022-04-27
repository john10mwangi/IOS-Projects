//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numOne: Int = 0, numTwo: Int = 0
    var isStarted: Bool = false, hasOps: Bool = false
    var existingOps: Bool = false
    var ops: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var screenOutput: UILabel!
    
    @IBAction func opsButtonPressed(_ sender: UIButton) {
        hasOps = true
        if existingOps {
            if (sender.currentTitle == "+"){
                screenOutput.text = "\(numOne)" + "+"
                ops = "add"
            }else if(sender.currentTitle == "-"){
                screenOutput.text = "\(numOne)" + "-"
                ops = "minus"
            }else if(sender.currentTitle == "×"){
                screenOutput.text =  "\(numOne)"  + "x"
                ops = "times"
            }else if (sender.currentTitle == "÷"){
                screenOutput.text =  "\(numOne)"  + "÷"
                ops = "divide"
            }
        }else{
            if (sender.currentTitle == "+"){
                ops = "add"
                screenOutput.text = screenOutput.text! + "+"
            }else if(sender.currentTitle == "-"){
                ops = "minus"
                screenOutput.text = screenOutput.text! + "-"
            }else if(sender.currentTitle == "×"){
                ops = "times"
                screenOutput.text = screenOutput.text! + "x"
            }else if (sender.currentTitle == "÷"){
                ops = "divide"
                screenOutput.text = screenOutput.text! + "÷"
            }
        }
        existingOps = true
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if hasOps {
            screenOutput.text = screenOutput.text! + sender.currentTitle!
            numTwo = getNumber(numStr: sender.currentTitle ?? "0")
        }else {
            screenOutput.text = sender.currentTitle!
            numOne = getNumber(numStr: sender.currentTitle ?? "0")
        }
    }
    
    func getNumber(numStr: String) -> Int {
        switch numStr {
        case "1":
            return 1
            
        case "2":
            return 2
            
        case "3":
            return 3
                
        case "4":
            return 4
                    
        case "5":
            return 5
                        
        case "6":
            return 6
                
        case "7":
            return 7
                    
        case "8":
            return 8
                        
        case "9":
            return 9
        default:
            return 0
        }
    }
    
    @IBAction func resultPressed(_ sender: UIButton) {
        print("equals pressed"+ops)
        if ops == "add" {
            screenOutput.text = screenOutput.text! + " = \(numOne+numTwo)"
            numOne = numOne+numTwo
        }else if ops == "minus" {
            screenOutput.text = screenOutput.text! + " = \(numOne-numTwo)"
            numOne = numOne-numTwo
        }else if ops == "times" {
            screenOutput.text = screenOutput.text! + " = \(numOne*numTwo)"
            numOne = numOne*numTwo
        }else if ops == "divide" {
            screenOutput.text = screenOutput.text! + " = \(numOne/numTwo)"
            numOne = numOne/numTwo
        }
        existingOps = false
        ops = ""
        hasOps = false
    }
}

