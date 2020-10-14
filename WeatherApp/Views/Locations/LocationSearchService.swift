//
//  LocationSearchService.swift
//  WeatherApp
//
//  Created by ty foskey on 10/8/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

class LocationSearchService: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchQuery = ""
    var completer: MKLocalSearchCompleter
    var networkManager: NetworkManager
    @Published var completions: [Location] = []
    var cancellable: AnyCancellable?
    let coordinatesCache = CoordinatesCache()
    
    init(networkManager: NetworkManager) {
        completer = MKLocalSearchCompleter()
        self.networkManager = networkManager
        super.init()
        cancellable = $searchQuery.assign(to: \.queryFragment, on: self.completer)
        completer.delegate = self
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        var newLocations = [Location]()
        for result in completer.results {
            if result.title.contains(",") {
                let location = Location(completion: result)
                newLocations.append(location)
            }
        }
        self.completions = newLocations
    }
    
    func requestItem(location: Location, completion: @escaping(WeatherViewModel) -> Void) {
        requestItemCoordinates(location: location) { (coordinates) in
            self.networkManager.client.getWeather(at: coordinates) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let weather):
                    let weatherView = WeatherViewModel(weather: weather, coordinate: coordinates)
                    completion(weatherView)
                }
            }
        }
    }
    
    private func requestItemCoordinates(location: Location, completion: @escaping(Coordinate) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = location.title
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error != nil {
                print(error)
            }
            
            guard let response = response,
                let item = response.mapItems.first else {
                return
            }
            
            let coordinate = item.placemark.coordinate
            completion(Coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude, cityName: location.title))
        }
    }
    
    func addNewWeatherView(weatherView: WeatherViewModel) {
        coordinatesCache.saveNew(weatherView.coordinates)
        networkManager.weatherViews.insert(weatherView, at: 0)
    }
    
    func deleteWeatherView(weatherView: WeatherViewModel) {
        if let index = networkManager.weatherViews.firstIndex(where: { $0.id == weatherView.id}) {
            coordinatesCache.delete(weatherView.coordinates)
            networkManager.weatherViews.remove(at: index)
        }
       
    }
    
    
    
}

