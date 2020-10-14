//
//  IndicatorPoint.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct IndicatorPoint: View {
    let isSelected: Bool
    var body: some View {
        ZStack{
            Circle()
                .stroke(isSelected ? Color(UIColor.white.withAlphaComponent(0.2)) : Color(.clear), style: StrokeStyle(lineWidth:3))
                .frame(width: 7, height: 7)
            Circle()
                .fill(Color(.white))
                .frame(width: 6, height: 6)
            
        }
        .frame(width: 7, height: 7)
        .shadow(color: isSelected ? Color(UIColor.white.withAlphaComponent(0.3)) : Color.clear, radius: 3, x: 0, y: 0)
    }
}


struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint(isSelected: false)
    }
}
