# WeatherLib

<div style="width: 1000px; height 600px;"><img src="WeatherLib.png" width="30%" height="30%" align="right"></div>

## Overview

WeatherLib is a weather framework which collects weather information from openweathermap API using Swift language.
Get the current weather for a particular location and check out forecasts!

The library incorporates:

- Example project
- MVC Pattern
- Swift
- Unit tests

## Features

- Get forecasts for a defined town
- Get the list of cities with their ID

## Requirements

- iOS 11.0+
- A valid API key from OpenWeatherMap

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate WeatherLib into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'WeatherLib'
```

Finally, implement the WeatherLib startWithAPIKey: method in your AppDelegate application:didFinishLaunchingWithOptions: method:

```swift
    WL.start(withAPIKey: "YOUR_API_KEY")
```