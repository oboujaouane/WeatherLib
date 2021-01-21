//
//  String+Extensions.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 20/01/2021.
//

extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
