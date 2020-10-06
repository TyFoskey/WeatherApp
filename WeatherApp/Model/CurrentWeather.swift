//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let sunrise: Double?
    let sunset: Double?
    let pop: Double?
    let temp: Double
    let pressure: Int
    let humidity: Int
    let dt: Int
    let wind_speed: Double
    let feels_like: Double
    let weather: [WeatherDetails]
    
  
}
