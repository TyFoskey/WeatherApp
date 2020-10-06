//
//  DetailView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var weatherView: WeatherViewModel?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("West Orange")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .semibold, design: .default))
                .padding(.top, 0)
                .padding(.leading, 12)
                .padding(.trailing, 12)
            Text(weatherView?.timeText ?? "--")
                .foregroundColor(Color.white)
                .font(.system(size: 20))
                .padding(.bottom, 30)

            HStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70,height:70)
                    .font(.system(size: 100, weight: .bold))
                    .padding(.leading, 16)
                    .padding(.top, 30)
                
                
                Text(weatherView?.weather.current.weather.first?.main ?? "--")
                    .font(Font.custom("headline", size: 60))
                    .padding(.top, 25)
                    .padding()
                Spacer()
            }
            .padding(.top, 0)
            .foregroundColor(Color(#colorLiteral(red: 0.8765596151, green: 0.8766866326, blue: 0.9076954722, alpha: 1)))
            .shadow(radius: 6)
            
            HStack(alignment: .lastTextBaseline) {
                Text(weatherView?.currentDegreesText ?? "--")
                    .foregroundColor(.white)
                    .font(.system(size: 160, weight: .thin, design: .rounded))
                    // .frame(height: 50)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 10)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity, maxHeight: 180, alignment: .leading)
                    .shadow(color: Color(UIColor.darkGray.withAlphaComponent(0.5)), radius: 6)
                Spacer()
                HighLowView(fontSize: 30, spacing: 13, topDegreeText: weatherView?.degreesHighText ?? "--", bottomDegreeText: weatherView?.degreesLowText ?? "--")
                    .frame(width: 75)
                    .padding(.trailing, 40)
            }
        }.background(Color.clear)
    }
}
