//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5D3D8262-D20A-49D5-95DA-06CF6DC8FE2F"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCurrencyPrice(for coin: String){
        let fullUrl = "\(baseURL)/\(coin)?apikey=\(apiKey)"
        let price = coinPrice(url: fullUrl)
//        print(price)
    }

    func coinPrice(url: String) -> Double {
        if let theUrl = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: theUrl) { (data, response, error) in
                if error != nil{
                    print(error!)
                }
                
                if let safeData = data{
                    self.JsonParser(data: safeData)
                }
            }
            task.resume()
        }
        
        return 0.0
    }
    
    func JsonParser(data: Data) {
        let parser = JSONDecoder()
        do {
            let result = try parser.decode(CurrencyParser.self, from: data)
            let coinCM = CoinCurrencyModel(name: result.asset_id_base, rate: result.rate, currency: result.asset_id_quote)
            delegate?.coinDidUpdate(update: coinCM)
        } catch {
            print(error)
            delegate?.failedWithError(error: error)
        }
    }
}

protocol CoinManagerDelegate {
    func coinDidUpdate(update: CoinCurrencyModel)
    func failedWithError(error: Error)
}

//CoinManagerDelegate {
//    func coinDidUpdate(update: CoinCurrencyModel)
//    func failedWithError(error: Error)
//}
