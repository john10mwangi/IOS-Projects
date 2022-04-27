//
//  GratuityViewController.swift
//  Tipsy
//
//  Created by John on 18/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class GratuityViewController: UIViewController {
    
    var amount = 0.0
    var rate = 0
    var splitting = 1
    
    @IBOutlet weak var moreDetails: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = String(format: "%.2f", amount)
        
        moreDetails.text = "Split between \(splitting) people, with \(rate) % tip"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
