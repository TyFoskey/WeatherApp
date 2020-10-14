//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by ty foskey on 10/2/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import UIKit
import SwiftUI

struct WeatherViewModel: Identifiable {
    
    var id: String
    let currentDegreesText: String
    let degreesHighText: String
    let degreesLowText: String
    let feelsLikeText: String
    let windSpeedText: String
    let humindityText: String
    let pressureText: String
    let iconUrl: URL?
    let weather: Weather
    let dateFormatter = DateFormatter()
    var probabilityArray: [Double] = []
    var probabilityTextArray: [String] = []
    var dailyWeatherViewModels: [DailyWeatherViewModel]
    let coordinates: Coordinate
    
    init(weather: Weather, coordinate: Coordinate) {
        self.weather = weather
        self.coordinates = coordinate
        self.id = "\(coordinate.cityName)"
        self.currentDegreesText = "\(Int(weather.current.temp))°"
        self.degreesHighText = "\(Int(weather.daily[0].temp.max))°"
        self.degreesLowText = "\(Int(weather.daily[0].temp.min))°"
        self.feelsLikeText = "\(Int(weather.current.feels_like))°"
        self.windSpeedText = "\(Int(weather.current.wind_speed)) km/h"
        self.humindityText = "\(weather.current.humidity)%"
        self.pressureText = "\(weather.current.pressure)"
        if let iconString = weather.current.weather.first?.icon {
          self.iconUrl = URL(string: "http://openweathermap.org/img/wn/\(iconString)@2x.png")!
        } else {
            self.iconUrl = nil
        }
        self.dailyWeatherViewModels = weather.daily.prefix(upTo: 8).map({
            return DailyWeatherViewModel(dailyWeather: $0)
        })
        self.probabilityArray = generateArrays().0
        self.probabilityTextArray = generateArrays().1
       
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
    
    var cityText: String {
        let delimiter = ","
        let cityTokens = coordinates.cityName.components(separatedBy: delimiter)
        return cityTokens[0]
    }
    
    private func generateArrays() -> ([Double], [String]) {
        var i = 0
        var probArray = [Double]()
        var probTextArray = [String]()
        for hour in weather.hourly {
            if i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20 {
                if let probability = hour.pop {
                    probArray.append(-probability * 100.0)
                    var timeText: String!
                    if i == 0 {
                        timeText = "Now"
                    } else {
                        timeText = createTimeText(timeInterval: Double(hour.dt))
                    }
                    probTextArray.append(timeText)
                }
            }
            i += 1
        }
        return (probArray, probTextArray)
    }
    
    
    var weatherImageString: String {
        guard let iconString = weather.current.weather.first?.icon else { return "" }
        switch iconString {
        case OpenWeatherIconTypes.clearDay.rawValue:
            return SystemImages.sun.rawValue
        case OpenWeatherIconTypes.clearNight.rawValue:
            return SystemImages.moon.rawValue
        case OpenWeatherIconTypes.fewCloudsDay.rawValue:
            return SystemImages.sun_cloud.rawValue
        case OpenWeatherIconTypes.fewCloudsNight.rawValue:
            return SystemImages.moon_cloud.rawValue
        case OpenWeatherIconTypes.scatteredCloudsDay.rawValue, OpenWeatherIconTypes.scatteredCloudsNight.rawValue:
            return SystemImages.cloud.rawValue
        case OpenWeatherIconTypes.brokenCloudsDay.rawValue, OpenWeatherIconTypes.brokenCloudNight.rawValue:
            return SystemImages.clouds.rawValue
        case OpenWeatherIconTypes.rainDay.rawValue, OpenWeatherIconTypes.rainNight.rawValue:
            return SystemImages.drizzle.rawValue
        case OpenWeatherIconTypes.thunderStormDay.rawValue, OpenWeatherIconTypes.thunderStormNight.rawValue:
            return SystemImages.thunderStorm.rawValue
        case OpenWeatherIconTypes.snowDay.rawValue, OpenWeatherIconTypes.snowNight.rawValue:
            return SystemImages.snow.rawValue
        case OpenWeatherIconTypes.mistDay.rawValue, OpenWeatherIconTypes.mistNight.rawValue:
            return SystemImages.mist.rawValue
        case OpenWeatherIconTypes.drizzleDay.rawValue, OpenWeatherIconTypes.drizzleNight.rawValue:
            return SystemImages.drizzle.rawValue
        default: fatalError("Not returning specified icon")
        }
    }
    
    var gradientBackground: Gradient {
        guard let iconString = weather.current.weather.first?.icon else { return Constants.gradients.clearSky }
        switch iconString {
        case OpenWeatherIconTypes.clearDay.rawValue, OpenWeatherIconTypes.fewCloudsDay.rawValue:
            return Constants.gradients.clearSky
        case OpenWeatherIconTypes.clearNight.rawValue, OpenWeatherIconTypes.fewCloudsNight.rawValue, OpenWeatherIconTypes.brokenCloudNight.rawValue, OpenWeatherIconTypes.scatteredCloudsNight.rawValue:
            return Constants.gradients.nightSky

        case OpenWeatherIconTypes.scatteredCloudsDay.rawValue, OpenWeatherIconTypes.brokenCloudsDay.rawValue, OpenWeatherIconTypes.mistDay.rawValue, OpenWeatherIconTypes.mistNight.rawValue:
            return Constants.gradients.cloudySky

        case OpenWeatherIconTypes.rainDay.rawValue, OpenWeatherIconTypes.rainNight.rawValue:
            return Constants.gradients.rainSky
        case OpenWeatherIconTypes.thunderStormDay.rawValue, OpenWeatherIconTypes.thunderStormNight.rawValue:
            return Constants.gradients.thunderStormSky
        case OpenWeatherIconTypes.snowDay.rawValue, OpenWeatherIconTypes.snowNight.rawValue:
            return Constants.gradients.rainSky
        case OpenWeatherIconTypes.drizzleDay.rawValue, OpenWeatherIconTypes.drizzleNight.rawValue:
            return Constants.gradients.cloudySky
        default: fatalError("Not returning specified icon")
        }
    }
 
    
}
