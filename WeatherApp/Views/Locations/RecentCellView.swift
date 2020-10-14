//
//  RecentCellView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/13/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct RecentCellView: View {
    let weatherView: WeatherViewModel
    let searchServie: LocationSearchService
    @Binding var showDelete: Bool
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: weatherView.gradientBackground, startPoint: .top, endPoint: UnitPoint(x: 0.2, y: 1.45))
                VStack (alignment: .center, spacing: 0) {
                    Image(systemName: weatherView.weatherImageString)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35,height:35)
                        .foregroundColor(Color.white)
                    
                    Text(weatherView.currentDegreesText)
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.leading, 8)
                }
                
            }
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(50)
            Text(weatherView.cityText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            if showDelete {
                Text("Delete")
                    .onTapGesture {
                        self.deleteTapped()
                }
                .font(.system(size: 18, weight: .medium))
                .frame(width: 100, height: 30)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(7)
                .padding(.top, 8)
            }
        }.frame(height: showDelete ? 170 : 150)
    }
    
    private func deleteTapped() {
        print("delete tapped")
        searchServie.deleteWeatherView(weatherView: weatherView)
    }
}

