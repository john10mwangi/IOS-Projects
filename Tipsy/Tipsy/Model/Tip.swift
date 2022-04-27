//
//  Tip.swift
//  Tipsy
//
//  Created by John on 18/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    
    var bill: Float = 0
    var gratuityRate: Int = 0
    var splitWays: Int = 1
    
    mutating func calculatePerPerson() -> Float{
        let rate = 1.0 + Float(gratuityRate)/100
        let amount = bill * rate
        print(amount)
        return amount/Float(splitWays)
    }
}
