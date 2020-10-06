//
//  DateExts.swift
//  WeatherApp
//
//  Created by ty foskey on 10/2/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

extension Date {
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
}
