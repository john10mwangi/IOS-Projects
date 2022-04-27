//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bmiModel = BMIModel()
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
   
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.setValue(1.5, animated: true)
        heightLabel.text = "\(1.5) m"
        weightSlider.setValue(10, animated: true)
        weightLabel.text = "\(10) kgs"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSliderChangedHeight(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f m", sender.value)
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f kgs", sender.value)
    }
    
    @IBAction func caculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        bmiModel.calculateBMI(weight, height)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultVC = segue.destination as! ResultViewController
            
            resultVC.BMIValue = bmiModel.getBMI()
            resultVC.adviceText = bmiModel.getAdvice()
            resultVC.bg = bmiModel.getColor()
        }
    }
}

