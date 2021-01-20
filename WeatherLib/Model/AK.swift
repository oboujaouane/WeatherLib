//
//  AK.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 16/01/2021.
//

open class WeatherLib {
    /**
    Returns the default singleton instance.
    */
    open class func shared() -> WeatherLib {
        struct Static {
            //Singleton instance.
            static let weatherLib = WeatherLib()
        }
        
        return Static.weatherLib
    }

    open var apiKey = "ADD_YOUR_API_HERE"
}
