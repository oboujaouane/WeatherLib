//
//  FakeResponseData.swift
//  WeatherLibTests
//
//  Created by ousama boujaouane on 20/01/2021.
//

import Foundation

class FakeResponseData {
    // MARK: - HTTP status code
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://www.groupe-psa.com")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: nil)!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://www.groupe-psa.com")!,
        statusCode: 500,
        httpVersion: nil,
        headerFields: nil)!

    // MARK: - Error
    class SimpleError: Error {}
    static let error = SimpleError()

    // MARK: - Incorrect data
    static let incorrectData = "erreur".data(using: .utf8)!

    // MARK: - OpenWeather
    static var weatherCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "openWeatherDataSet", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
}
