//
//  ViewController.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 15/01/2021.
//

import UIKit
import WeatherLib

class CitiesViewController: UIViewController {
    
    // MARK: - Properties
    private var selectedCity: City?
    private let segueIdentifier = "segueToCityDetail"
    
    // MARK: - Life cycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let cityDetailVC = segue.destination as! CityDetailViewController
            cityDetailVC.city = selectedCity
        }
    }
    
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
        selectedCity = Cities.list[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}

