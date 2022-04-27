//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyInitials: UILabel!
    @IBOutlet weak var currencyAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }

}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCurrencyPrice(for: coinManager.currencyArray[row])
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    
    func coinDidUpdate(update: CoinCurrencyModel) {
        DispatchQueue.main.async {
            self.currencyInitials.text = update.currency
            self.currencyAmount.text = String(format: "%.4f", update.rate)
        }
    }
    
    func failedWithError(error: Error) {
        print(error)
    }
}

