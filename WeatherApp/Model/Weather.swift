//
//  Weather.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let lat: Double
    let lon: Double
    let current: CurrentWeather
    let daily: [DailyWeather]
    let hourly: [CurrentWeather]
}
