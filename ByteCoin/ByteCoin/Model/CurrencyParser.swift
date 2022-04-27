//
//  CurrencyParser.swift
//  ByteCoin
//
//  Created by John on 22/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct CurrencyParser: Codable {
    let rate: Double
    let asset_id_quote: String
    let asset_id_base: String
}
