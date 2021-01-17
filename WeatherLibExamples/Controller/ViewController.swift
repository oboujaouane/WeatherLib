//
//  ViewController.swift
//  WeatherLibExamples
//
//  Created by ousama boujaouane on 15/01/2021.
//

import UIKit
import WeatherLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(WheatherLib.shared().apiKey)
    }

}

