//
//  CityDetailViewController.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 20/01/2021.
//

import UIKit
import WeatherLib

class CityDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    
    // MARK: - Property
    var city: City?
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let city = city else {
            return
        }
        callWeatherService(for: city)
    }
    
    private func callWeatherService(for city: City) {
        WeatherService.shared().getWeather(for: city.id) { [weak self] success, weather in
            guard let self = self else { return }
            
            if success, let weather = weather {
                self.nameLabel.text = city.name
                self.descriptionLabel.text = weather.weather[0].weatherDescription.capitalizingFirstLetter()
                self.temperatureLabel.text = "\(Int(weather.main.temp))°C"
                self.humidityLabel.text = "Humidité : \(weather.main.humidity)%"
            } else {
                self.presentAlert(title: "Petit problème",
                                  message: "Une erreur est survenue.\nVeuillez réessayer.")
            }
        }
    }
}
