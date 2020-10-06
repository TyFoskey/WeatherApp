//
//  WeatherView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/2/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    
    @State var weatherViewModel: WeatherViewModel?
    var percentRain: [Double] = [-100, -90, -80, -40, -20, -70]
    @State private var show = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1235450134, green: 0.162923485, blue: 0.3995254636, alpha: 1)), Color(#colorLiteral(red: 0.5875741839, green: 0.3832167387, blue: 0.6324897408, alpha: 1))]), startPoint: .top, endPoint: UnitPoint(x: 0.2, y: 1.45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderView()
                
                if show {
                    DetailView(weatherView: weatherViewModel)
                    Spacer()
                    TitleView(title: "HOURLY")
                    if weatherViewModel != nil {
                       LineView(data: self.weatherViewModel?.temps ?? [],
                             bottomTitles: self.weatherViewModel?.tempTimeTexts ?? [])
                        .frame(height: 160)
                    }
                } else {
                    TitleView(title: "DETAILS")
                    ExtraDetailsView(weatherView: weatherViewModel)
                    Spacer()
                    TitleView(title: "CHANCE OF RAIN")
                    LineView(data: self.weatherViewModel?.probabilityArray ?? [],
                             bottomTitles: self.weatherViewModel?.probabilityTextArray ?? [])
                        .frame(height: 170)
                        .padding(.top, 20)
                    Spacer()
                    TitleView(title: "NEXT 7 DAYS")
                    DaysView(dailyWeather: self.weatherViewModel?.weather.daily ?? [])
                }
                
                
            }
            
        }.onTapGesture {
            print("tapped")
            withAnimation(.easeInOut(duration: 1.0)) {
                self.show.toggle()
            }
        }
        
    }
}
