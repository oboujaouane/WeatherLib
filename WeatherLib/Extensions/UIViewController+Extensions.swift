//
//  ViewController.swift
//  WeatherLib
//
//  Created by ousama boujaouane on 20/01/2021.
//

import UIKit

extension UIViewController {
    /**
     - Parameters:
        - title: The alert's title
        - message: The error message to be displayed
     */
    public func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
