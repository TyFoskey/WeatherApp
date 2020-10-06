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
    @ObservedObject var networkManger = NetworkManager(coordinates: Coordinate(latitude: 40.7986, longitude: -74.2391))
//    @State private var show = true
    
    var body: some View {
        ForEach(networkManger.weatherViews) {
            WeatherView(weatherViewModel: $0)
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
