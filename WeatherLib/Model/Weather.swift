//
//  Weather.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 20/01/2021.
//

import Foundation

// MARK: - Weather
struct EntireWeather: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherId: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherId = "id"
        case main
        case weatherDescription = "description"
        case icon
    }
}
