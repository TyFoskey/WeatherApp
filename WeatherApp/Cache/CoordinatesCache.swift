//
//  CoordinatesCache.swift
//  WeatherApp
//
//  Created by ty foskey on 10/13/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

//set, get & remove coordinates  in cache
struct CoordinatesCache {
    private let key = "CoordinatesKey"
    
    func save(_ values: [Coordinate]) {
        var datas = [Data]()
        for value in values {
            let data = try! PropertyListEncoder().encode(value)
            datas.append(data)
        }
        UserDefaults.standard.set(datas, forKey: key)
       // UserDefaults.standard.synchronize()
    }
    
    func saveNew(_ value: Coordinate) {
        var coordinates = get()
        coordinates.insert(value, at: 0)
        save(coordinates)
    }
    
    func get() -> [Coordinate] {
        var coordinates = [Coordinate]()
        if let datas = UserDefaults.standard.value(forKey: key) as? [Data] {
            print(datas.count, "data count")
            for data in datas {
                if let coordinateData = try? PropertyListDecoder().decode(Coordinate.self, from: data) {
                    coordinates.append(coordinateData)
                }
            }
        }
        return coordinates
    }
    
    func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func delete(_ value: Coordinate) {
        var coordinates = get()
        if let index = coordinates.firstIndex(where: { $0.cityName == value.cityName}) {
            coordinates.remove(at: index)
        }
        
        save(coordinates)
    }
}
