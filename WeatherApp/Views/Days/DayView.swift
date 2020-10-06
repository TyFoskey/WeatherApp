//
//  DayView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct DayView: View {
    let day: DailyWeather
    let imageName: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(day.weather.first?.main ?? "--")
            .fixedSize()
                .font(.system(size: 15, weight: .semibold))
                .padding(.top, 25)
                .padding(.bottom, 8)
                .frame(width: 35)
                .lineLimit(1)
            
            Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30, alignment: .top)
            
           // Spacer()
            
            HighLowView(fontSize: 16, spacing: 5, topDegreeText: "\(Int(day.temp.max))°", bottomDegreeText: "\(Int(day.temp.min))°")
                .frame(width: 35)
                .padding(.top, 5)
                .padding(.bottom, 12)
                
        }
        .foregroundColor(Color(UIColor.white.withAlphaComponent(0.7)))
    }
}
