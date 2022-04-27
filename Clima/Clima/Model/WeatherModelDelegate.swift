//
//  WeatherModelDelegate.swift
//  Clima
//
//  Created by John on 21/03/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherModelDelegate {
    func didUpdateWeather(weather: WeatherModel)
}
