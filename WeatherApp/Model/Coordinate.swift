//
//  Coordinate.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    let cityName: String
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var newYorkCity: Coordinate {
        return Coordinate(latitude: 40.7128, longitude: -74.0060, cityName: "New York")
    }
}
