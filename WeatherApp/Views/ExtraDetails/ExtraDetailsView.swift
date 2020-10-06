//
//  ExtraDetailsView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct ExtraDetailsView: View {
    let weatherView: WeatherViewModel?
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                BoxView(imageName: "thermometer", titleText: "Feels like", subTitleText: weatherView?.feelsLikeText ?? "--")
                BoxView(imageName: "wind", titleText: "Wind", subTitleText: weatherView?.windSpeedText ?? "--")
                BoxView(imageName: "drop.triangle", titleText: "Humidity", subTitleText: weatherView?.humindityText ?? "--")

            }
            
            HStack(spacing: 12) {
                BoxView(imageName: "speedometer", titleText: "Pressure", subTitleText: weatherView?.pressureText ?? "--")
                BoxView(imageName: "sunrise", titleText: "Sunrise", subTitleText: weatherView?.sunriseText ?? "--")
                BoxView(imageName: "sunset", titleText: "Sunset", subTitleText: weatherView?.sunsetText ?? "--")


            }
        }
        .padding(.top, 16)
    }
}

struct ExtraDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraDetailsView(weatherView: nil)
    }
}
