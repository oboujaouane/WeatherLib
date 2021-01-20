//
//  AK.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 16/01/2021.
//

open class WheatherLib {
    /**
    Returns the default singleton instance.
    */
    open class func shared() -> WheatherLib {
        struct Static {
            //Singleton instance. Initializing keyboard manger.
            static let wlManager = WheatherLib()
        }
        
        return Static.wlManager
    }

    open var apiKey = "ADD_YOUR_API_HERE"
}
