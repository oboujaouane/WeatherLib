//
//  ViewController.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 15/01/2021.
//

import UIKit
import WeatherLib

class ViewController: UIViewController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        callWeatherService(for: 2988507) // Test with Paris id
    }
    
    // MARK: - Private function
    private func callWeatherService(for cityId: Int) {
        WeatherService.shared().getWeather(for: cityId) { [weak self] success, weather in
            guard let self = self else { return }
            
            if success, let weather = weather {
                print(weather.weather[0].weatherDescription.capitalizingFirstLetter())
                print("\(Int(weather.main.temp))°C")
                print("Humidité : \(weather.main.humidity)%")
            } else {
                self.presentAlert(title: "Petit problème",
                                  message: "Une erreur est survenue.\nVeuillez réessayer.")
            }
        }
    }
    
}

