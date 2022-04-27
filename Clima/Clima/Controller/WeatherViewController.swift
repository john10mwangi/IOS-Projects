//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    var weatherNow: WeatherModel?
    
    var openWeather = OpenWeather()
    
    @IBAction func currentLocationPressed(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
    }
    var locationManager = CLLocationManager()

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        openWeather.delegate = self
        searchView.delegate = self
    }
    

}

extension WeatherViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            openWeather.setUrl(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

extension WeatherViewController: WeatherModelDelegate{
    
    func didUpdateWeather(weather: WeatherModel) {
        weatherNow = weather
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage.init(systemName: weather.conditions)
            self.temperatureLabel.text = weather.temperature
            self.cityLabel.text = weather.city
        }
    }
}

extension WeatherViewController: UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchView.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            openWeather.setUrl(city)
        }
        textField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type here to search"
            return false
        }
    }
}

