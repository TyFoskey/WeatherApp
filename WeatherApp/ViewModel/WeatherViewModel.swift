//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by ty foskey on 10/2/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import UIKit

struct WeatherViewModel: Identifiable {
    
    var id: String
    let currentDegreesText: String
    let degreesHighText: String
    let degreesLowText: String
    let feelsLikeText: String
    let windSpeedText: String
    let humindityText: String
    let pressureText: String
    let weather: Weather
    let dateFormatter = DateFormatter()
    
    init(weather: Weather) {
        self.weather = weather
        self.id = "\(weather.current.dt)"
        self.currentDegreesText = "\(Int(weather.current.temp))°"
        self.degreesHighText = "\(Int(weather.daily[0].temp.max))°"
        self.degreesLowText = "\(Int(weather.daily[0].temp.min))°"
        self.feelsLikeText = "\(Int(weather.current.feels_like))°"
        self.windSpeedText = "\(Int(weather.current.wind_speed)) km/h"
        self.humindityText = "\(weather.current.humidity)%"
        self.pressureText = "\(weather.current.pressure)"
        
    }
    

    var temps: [Double] {
        let twentyfourHourTemps = weather.hourly.dropLast(24)
        return twentyfourHourTemps.map({
            return $0.temp * -1
        })
    }
    
    var tempTimeTexts: [String] {
        var isFirst = true
        return weather.hourly.map({
            if isFirst == true {
                isFirst = false
                return "Now"
            }
           return createTimeText(timeInterval: Double($0.dt))
        })
    }
    
    private func createTimeText(timeInterval: Double) -> String {
        let timestampDate = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateFormat = "ha"
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        return dateFormatter.string(from: timestampDate)
    }
    
    var timeText: String {
        let timestampDate = Date(timeIntervalSince1970: Double(weather.current.dt))
        dateFormatter.dateFormat = "EEEE d, MMMM"
        return dateFormatter.string(from: timestampDate)
    }
    
    var sunriseText: String {
        guard let sunriseTime = weather.current.sunrise else { return "" }
        let timestampDate = Date(timeIntervalSince1970: Double(sunriseTime))
        dateFormatter.dateFormat = "h:ma"
        return dateFormatter.string(from: timestampDate)
    }

    var sunsetText: String {
        guard let sunsetTime = weather.current.sunset else { return "" }
        let timestampDate = Date(timeIntervalSince1970: Double(sunsetTime))
        dateFormatter.dateFormat = "h:ma"
        return dateFormatter.string(from: timestampDate)
    }
    
    var probabilityText: String {
        guard let probability = weather.hourly.first?.pop else { return "" }
        return "\(probability * 100)"
    }
    
    var probabilityArray: [Double] {
        var i = 0
        var probArray = [Double]()
        for hour in weather.hourly {
            if i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20 {
                if let probability = hour.pop {
                    probArray.append(-probability * 100.0)
                }
            }
            i += 1
        }
        return probArray
    }
    
    var probabilityTextArray: [String] {
        var i = 0
        var probArray = [String]()
        for hour in weather.hourly {
            if i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20 {
                var timeText: String!
                if i == 0 {
                    timeText = "Now"
                } else {
                    timeText = createTimeText(timeInterval: Double(hour.dt))
                }
                probArray.append(timeText)
            }
            i += 1
        }
        return probArray
    
    }
    
}
