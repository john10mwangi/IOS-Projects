//
//  WeatherModel.swift
//  Clima
//
//  Created by John on 21/03/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let city: String
    let temp: Double
    let conditioniId: Int
    
    var temperature: String{
        return String(format: "%.1f", temp)
    }
    
    var conditions: String {
        switch conditioniId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...771:
            return "cloud.fog"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud.sun"
        }
    }
    
}
