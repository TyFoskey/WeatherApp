//
//  OpenWeatherError.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

enum OpenWeatherError: Error {
    case requestFailed
    case invalidData
    case invalidUrl
    case error
}
