//
//  WeatherLibTests.swift
//  WeatherLibTests
//
//  Created by ousama boujaouane on 15/01/2021.
//

import XCTest
@testable import WeatherLib

class WeatherServiceTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil,
                                                                           response: nil,
                                                                           error: FakeResponseData.error)
        )

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(for: 5128638) { success, entireWeather in // Test with New York id
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(entireWeather)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil,
                                                                           response: nil,
                                                                           error: nil)
        )

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(for: 2988507) { success, entireWeather in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(entireWeather)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(
            data: FakeResponseData.weatherCorrectData,
            response: FakeResponseData.responseKO,
            error: nil)
        )

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(for: 2988507) { success, entireWeather in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(entireWeather)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
          // Given
          let weatherService = WeatherService(weatherSession: URLSessionFake(
            data: FakeResponseData.incorrectData,
            response: FakeResponseData.responseOK,
            error: nil)
          )

          // When
          let expectation = XCTestExpectation(description: "Wait for queue change.")
          weatherService.getWeather(for: 2988507) { success, entireWeather in
              //Then
              XCTAssertFalse(success)
              XCTAssertNil(entireWeather)
              expectation.fulfill()
          }

          wait(for: [expectation], timeout: 0.01)
      }

    func testGetWeatherShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(
            data: FakeResponseData.weatherCorrectData,
            response: FakeResponseData.responseOK,
            error: nil)
        )

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(for: 2988507) { success, entireWeather in
            //Then
            let city = "New York"
            let description = "overcast clouds"
            let temp = 17.85

            XCTAssertTrue(success)
            XCTAssertNotNil(entireWeather)
            XCTAssertEqual(city, entireWeather?.name)
            XCTAssertEqual(description, entireWeather?.weather[0].weatherDescription)
            XCTAssertEqual(temp, entireWeather?.main.temp)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
}
