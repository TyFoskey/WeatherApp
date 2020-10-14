//
//  DailyWeatherViewModel.swift
//  WeatherApp
//
//  Created by ty foskey on 10/6/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

class DailyWeatherViewModel {
    
    let tempHigh: String
    let tempLow: String
    let weatherText: String?
    private let iconString: String?
    
    init(dailyWeather: DailyWeather) {
        self.tempHigh = "\(Int(dailyWeather.temp.max))°"
        self.tempLow = "\(Int(dailyWeather.temp.min))°"
        self.weatherText = dailyWeather.weather.first?.main
        self.iconString = dailyWeather.weather.first?.icon
    }
    
    var weatherImageString: String {
        guard let iconString = iconString else { return "" }
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
}
