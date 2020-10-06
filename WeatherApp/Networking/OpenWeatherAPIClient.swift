//
//  OpenWeatherAPIClient.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

class OpenWeatherAPIClient {
    
    private let apiKey = "962d30b87b27d8d6f4a37e1612039cfa"
    let session: URLSession
    let decoder = JSONDecoder()
    typealias WeatherCompletion = (Result<Weather, OpenWeatherError>) -> Void
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletion) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&units=imperial&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("invalid url")
            completion(.failure(.invalidUrl))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) {[weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            guard error == nil else {
                print(error?.localizedDescription, "error descrip")
                return
            }
            DispatchQueue.main.async {
                guard let data = data else {
                    print(error?.localizedDescription, "error descrip  data")
                    completion(.failure(.error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print(error?.localizedDescription, "error descrip http respsonse")
                    completion(.failure(.requestFailed))
                    return
                }
                
                
                if httpResponse.statusCode == 200 {
                    do {
                        let weather = try strongSelf.decoder.decode(Weather.self, from: data)
                        completion(.success(weather))
                    } catch {
                        print(error, "error descrip catch")
                        completion(.failure(.error))
                    }
                } else {
                    print(error?.localizedDescription, "invalid data")
                    completion(.failure(.invalidData))
                }
            }
        }
        
        task.resume()
    }
    
}
