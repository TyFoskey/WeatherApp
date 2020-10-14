//
//  WeatherView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/2/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    
    let weatherViewModel: WeatherViewModel?
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: weatherViewModel?.gradientBackground ?? Constants.gradients.clearSky, startPoint: .top, endPoint: UnitPoint(x: 0.2, y: 1.45))
                .edgesIgnoringSafeArea(.all)
            VStack {
                if show == false {
                    DetailView(weatherView: weatherViewModel)
                        .padding(.top, 16)
                    Spacer()
                    TitleView(title: "HOURLY")
                    LineView(data: weatherViewModel?.temps ?? [],
                             bottomTitles: weatherViewModel?.tempTimeTexts ?? [])
                        .frame(height: 160)
                    
                } else {
                    TitleView(title: "DETAILS")
                    ExtraDetailsView(weatherView: weatherViewModel)
                    Spacer()
                    TitleView(title: "CHANCE OF RAIN")
                    LineView(data: weatherViewModel?.probabilityArray ?? [],
                             bottomTitles: weatherViewModel?.probabilityTextArray ?? [])
                        .frame(height: 170)
                        .padding(.top, 20)
                    Spacer()
                    TitleView(title: "NEXT 7 DAYS")
                    DaysView(dailyWeather: weatherViewModel?.dailyWeatherViewModels ?? [])
                }
            }.padding(.top, 30)//.onTapGesture {
//                print("tapped")
//                withAnimation(.easeInOut(duration: 1.0)) {
//                    self.show.toggle()
//                }
//            }
            
        }
        
    }
    func yo() {
        
    }
}
