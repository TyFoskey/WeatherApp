//
//  DaysView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct DaysView: View {
    var dailyWeather: [DailyWeatherViewModel]
    var body: some View {
        HStack(spacing: 20) {
            ForEach(1..<dailyWeather.count) { index in
                DayView(day: self.dailyWeather[index])
            }
        }.padding([.leading, .trailing], 20)
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(dailyWeather: [])
    }
}
