//
//  ContentView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/27/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var temps: [Double] = [-25,-25,-28,-25,-23,-16,-11,-22,-24,-23,-24,-20]
    @EnvironmentObject var networkManger: NetworkManager
    //    @State private var show = true
    
    var body: some View {
        WeatherViewsContainer(weatherViews: $networkManger.weatherViews)
    }
}

struct WeatherViewsContainer: View {
    @Binding var weatherViews: [WeatherViewModel]
    @State var isShowingWeather = true
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            if isShowingWeather {
                ZStack {
                    if weatherViews.first != nil {
                        WeatherView(weatherViewModel: weatherViews.first, show: $showDetails)
                            .preferredColorScheme(.dark)
                    }
                    
                    VStack {
                        HeaderView(isPresented: $isShowingWeather, isShowingDetails: $showDetails)
                        Spacer()
                    }.padding(.top, 20)
                }.onTapGesture {
                    print(self.weatherViews.count, "weather view count")
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.showDetails.toggle()
                    }
                }
            } else {
                LocationsView(isPresented: self.$isShowingWeather, weatherViewModels: self.$weatherViews)
            }
        }
    }

}

struct NewView: View {
    var body: some View {
        VStack {
            Color.gray
            Text("Hey this is a new view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
