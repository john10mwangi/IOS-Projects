//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by John on 17/03/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var BMIValue = 0.0
    var adviceText = ""
    var bg = UIColor.clear
    

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(BMIValue)
        print(adviceText)

        // Do any additional setup after loading the view.
        resultLabel.text = String(format: "%.1f",  BMIValue)
        adviceLabel.text = adviceText
        
        view.backgroundColor = bg
    }
    

    @IBAction func recalcutatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
