//
//  Location.swift
//  WeatherApp
//
//  Created by ty foskey on 10/6/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import MapKit

class Location: ObservableObject {
    let title: String
    let subtitle: String
    let id: String
    
    init(completion: MKLocalSearchCompletion) {
        title = completion.title
        subtitle = completion.subtitle
        id = completion.title + completion.subtitle
    }
}

extension Location: Identifiable {}
