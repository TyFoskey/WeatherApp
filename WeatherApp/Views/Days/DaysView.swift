//
//  DaysView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct DaysView: View {
    let dailyWeather: [DailyWeather]
    var body: some View {
        HStack(spacing: 20) {
            DayView(day: dailyWeather[0], imageName: "cloud.rain.fill")
            DayView(day: dailyWeather[1], imageName: "cloud.sun.fill")
            DayView(day: dailyWeather[2], imageName: "cloud.bolt.rain")
            DayView(day: dailyWeather[3], imageName: "snow")
            DayView(day: dailyWeather[4], imageName: "sun.max.fill")
            DayView(day: dailyWeather[5], imageName: "cloud.rain.fill")
            DayView(day: dailyWeather[6], imageName: "sun.max")
        }
        .padding([.leading, .trailing], 20)
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(dailyWeather: [])
    }
}
