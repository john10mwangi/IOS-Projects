//
//  WeatherData.swift
//  Clima
//
//  Created by John on 21/03/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let timezone: Int
    let main: Main
    let weather: [Weather]
}

struct Weather: Decodable {
    let main: String
    let description: String
    let id: Int
    
}

struct Main: Decodable {
    let temp: Double
}
