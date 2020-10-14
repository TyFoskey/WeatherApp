//
//  ArrayExts.swift
//  WeatherApp
//
//  Created by ty foskey on 10/13/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size:Int) -> [[Element]] {
       
        var chunkedArray = [[Element]]()
        
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - index % size..<index]))
            }
        }
        
        return chunkedArray
    }
}
