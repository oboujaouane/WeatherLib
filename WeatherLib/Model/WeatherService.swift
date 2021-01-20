//
//  WeatherService.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 20/01/2021.
//

import Foundation

open class WeatherService {
    // MARK: - Properties
    /**
    Returns the default singleton instance.
    */
    open class func shared() -> WeatherService {
        struct Static {
            //Singleton instance. Initializing keyboard manger.
            static let weatherService = WeatherService()
        }
        
        return Static.weatherService
    }
    
    private init() {}
    private var task: URLSessionDataTask?

    private var weatherSession = URLSession(configuration: .default)
    init(weatherSession: URLSession) {
        self.weatherSession = weatherSession
    }

    // MARK: - Function
    open func getWeather(for cityId: Int, callback: @escaping (Bool, EntireWeather?) -> Void) {
        OpenWeather.city = String(cityId)
        var request = URLRequest(url: URL(string: OpenWeather.url)!)
        request.httpMethod = "GET"

        task?.cancel()
        task = weatherSession.dataTask(with: request) { data, response, error in // dependency injection
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }

                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }

                guard let responseJSON = try? JSONDecoder().decode(EntireWeather.self, from: data) else {
                    callback(false, nil)
                    return
                }

                callback(true, responseJSON)
            }
        }
        task?.resume()
    }
}

// MARK: - Weather
fileprivate class OpenWeather {
    // MARK: - Properties
    static private let endpoint = "https://api.openweathermap.org/data/2.5/weather"
    static private var parameters: String {
        return "?units=metric&id=\(city)&lang=fr" // Get Celsius instead of Fahrenheit for city of New York
    }
    static private let accessKey = "&appid=\(WeatherLib.shared().apiKey)"

    static var city = ""
    static var url: String {
        return OpenWeather.endpoint + OpenWeather.parameters + OpenWeather.accessKey
    }
}
