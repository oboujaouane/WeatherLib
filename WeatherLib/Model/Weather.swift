//
//  Weather.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 20/01/2021.
//

import Foundation

// MARK: - Weather
public struct EntireWeather: Codable {
    public let weather: [Weather]
    public let main: Main
    public let name: String
}

// MARK: - Main
public struct Main: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double
    public let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
public struct Weather: Codable {
    public let weatherId: Int
    public let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherId = "id"
        case main
        case weatherDescription = "description"
        case icon
    }
}
