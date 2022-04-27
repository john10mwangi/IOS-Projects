//
//  OpenWeather.swift
//  Clima
//
//  Created by John on 21/03/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherModelDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct OpenWeather {
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=792897aa54d3203b1d9862c5e19facac&units=metric"
    
    var delegate: WeatherModelDelegate?
    
    func setUrl(_ searchText: String) {
        let full_url = "\(baseUrl)&q=\(searchText)"
        makeRequest(strUrl: full_url)
    }
    
    func setUrl(latitude lat: Double, longitude lon: Double) {
        let full_url = "\(baseUrl)&lat=\(lat)&lon=\(lon)"
        makeRequest(strUrl: full_url)
    }
    
    func makeRequest(strUrl: String){
        if let url = URL(string: strUrl) {
            let session = URLSession(configuration: .default)
            
//            method 1 without closure
            /*let task = session.dataTask(with: url, completionHandler: completionHandler(data:response:error:))
            */
            
//            method 2 with closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err)
                }
                if let resData = data {
                    if let weather = self.parseJSON(resData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func completionHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let err = error {
            print(err)
        }
        
        if let resData = data {
            let printable = String(data: resData, encoding: .utf8)
            print(printable ?? "Nothing to print")
        }
    }
    
    func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            let conditionId = weatherData.weather[0].id
            let city = weatherData.name
            let temperature = weatherData.main.temp
            let weather = WeatherModel(city: city, temp: temperature, conditioniId: conditionId)
            
            return weather
        } catch {
            print(error)
            return nil
        }
    }
}
