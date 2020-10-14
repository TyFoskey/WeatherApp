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
    let coordinatesCache: CoordinatesCache
    
    var weatherViews = [WeatherViewModel]() {
        didSet {
            print("did set")
            objectWillChange.send()
            didChange.send(self)
        }
    }
    
    var coordinates = [Coordinate]() {
        didSet {
            print(coordinates.count, "coordinate count")
            //coordinatesCache.save(coordinates)
        }
    }
    
    
    init(coordinates: [Coordinate], coordinatesCache: CoordinatesCache) {
        self.coordinatesCache = coordinatesCache
        self.coordinates = coordinates
        for coordinate in coordinates {
            print(coordinate.cityName, "city name")
            client.getWeather(at: coordinate) {[weak self] (result) in
                guard let strongSelf = self else { return }
                switch result {
                case .failure(let error):
                    print(error.localizedDescription, "the error")
                    
                case .success(let weather):
                    let weatherViewModel = WeatherViewModel(weather: weather, coordinate: coordinate)
                    //   strongSelf.weatherView = weatherViewModel
                    strongSelf.weatherViews.append(weatherViewModel)
                }
            }
        }
        
    }
    
}
