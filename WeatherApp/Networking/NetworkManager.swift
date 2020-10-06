//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkManager,Never>()
    let client = OpenWeatherAPIClient()
    
    var weatherViews = [WeatherViewModel]() {
        didSet {
            print("did set")
            objectWillChange.send()
            didChange.send(self)
        }
    }
    
    init(coordinates: Coordinate) {
        client.getWeather(at: coordinates) {[weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription, "the error")
                
            case .success(let weather):
               let weatherViewModel = WeatherViewModel(weather: weather)
            //   strongSelf.weatherView = weatherViewModel
               strongSelf.weatherViews.append(weatherViewModel)
            }
        }
    }
}
