//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = TipModel()
    
    var splits = 1
    var tipRate = 0

    @IBOutlet weak var tip20: UIButton!
    @IBOutlet weak var tip10: UIButton!
    @IBOutlet weak var noTip: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var billAmount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitLabel.text = String(format: "%d", splits)
        stepper.minimumValue = 1
    }

    @IBAction func billSplitListener(_ sender: UIStepper) {
        splits = Int(sender.value)
        splitLabel.text = String(format: "%.0f",  sender.value)
    }
    
    @IBAction func onTipClicked(_ sender: UIButton) {
        sender.isSelected = true
        sender.setTitleColor(.white, for: .selected)
        if sender.currentTitle == "0%"{
            tipRate = 0
            tip20.isSelected = false
            tip10.isSelected = false
            tip10.setTitleColor(#colorLiteral(red: 0.2246901945, green: 0.6872223985, blue: 0.4336023566, alpha: 1), for: .normal)
        }else if sender.currentTitle == "10%"{
            tipRate = 10
            tip20.isSelected = false
            noTip.isSelected = false
        }else {
            tipRate = 20
            tip10.isSelected = false
            noTip.isSelected = false
            tip10.setTitleColor(#colorLiteral(red: 0.2246901945, green: 0.6872223985, blue: 0.4336023566, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill: Float? = Float(billAmount.text ?? "0")
        
        model.calculateTip(bill: bill ?? 0.0, rate: tipRate, splits: splits)
        
        self.performSegue(withIdentifier: "toShowResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowResults" {
            let gratuityVC = segue.destination as! GratuityViewController
            gratuityVC.amount = Double(model.getAmount())
            gratuityVC.rate = model.getRate()
            gratuityVC.splitting = model.getSplitting()
        }
    }
}

