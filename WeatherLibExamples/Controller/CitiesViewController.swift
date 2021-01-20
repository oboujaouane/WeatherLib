//
//  ViewController.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 15/01/2021.
//

import UIKit
import WeatherLib

class CitiesViewController: UIViewController {
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
//         callWeatherService(for: 2988507) // Test with Paris id

//    // MARK: - Private function
//    private func callWeatherService(for cityId: Int) {
//        WeatherService.shared().getWeather(for: cityId) { [weak self] success, weather in
//            guard let self = self else { return }
//
//            if success, let weather = weather {
//                print(weather.weather[0].weatherDescription.capitalizingFirstLetter())
//                print("\(Int(weather.main.temp))°C")
//                print("Humidité : \(weather.main.humidity)%")
//            } else {
//                self.presentAlert(title: "Petit problème",
//                                  message: "Une erreur est survenue.\nVeuillez réessayer.")
//            }
//        }
//    }
    
}

// MARK: - Extension allowing to congigure table view and cells details
extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Cities.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        
        cityCell.textLabel?.text = Cities.list[indexPath.row].name
        cityCell.detailTextLabel?.text = Cities.list[indexPath.row].relatedCountry

        return cityCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: ADD When detailCityViewController added
    }
}

