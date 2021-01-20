//
//  AppDelegate.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 15/01/2021.
//

import UIKit
import WeatherLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WeatherLib.shared().apiKey = "b828fe546e4269ad871ed35d48c4ac61"
        return true
    }
}
