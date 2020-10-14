//
//  LocationCellView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/6/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct LocationCellView: View {
    let weatherView: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: weatherView.gradientBackground, startPoint: .top, endPoint: .bottomTrailing)
            HStack (alignment: .center) {
                VStack(alignment: .center, spacing: 0) {
                    Text(weatherView.cityText)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color.white)
                    
                    Text(weatherView.timeText)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
                }.padding(.leading, 20)
                Spacer()
                VStack (alignment: .center, spacing: 0) {
                    Image(systemName: weatherView.weatherImageString)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height:30)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 3)
                    
                    Text(weatherView.currentDegreesText)
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color.white)
                }.padding(.trailing, 16)
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: 110)
        
    }
}

