//
//  TipModel.swift
//  Tipsy
//
//  Created by John on 18/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipModel{
    
    var tip: Tip?
    
    mutating func calculateTip(bill: Float, rate: Int, splits: Int){
        tip = Tip(bill: bill, gratuityRate: rate, splitWays: splits)
    }
    
    mutating func getAmount() -> Float {
        return tip?.calculatePerPerson() ?? 0.0
    }
    
    func getRate() -> Int {
        return tip?.gratuityRate ?? 0
    }
    
    func getSplitting() -> Int {
        return tip?.splitWays ?? 1
    }
    
}
