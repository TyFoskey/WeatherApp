//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

struct DailyWeather: Codable {
    let temp: Temp
    let weather: [WeatherDetails]
}

struct Temp: Codable {
    let min: Double
    let max: Double
}
