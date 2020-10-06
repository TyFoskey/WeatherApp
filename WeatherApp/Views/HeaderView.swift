//
//  HeaderView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    let whiteBackgroundColor = Color(red: 1, green: 1, blue: 1, opacity: 0.8)
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(whiteBackgroundColor)
                .font(.system(size: 23, weight: .semibold, design: .monospaced))
                .padding(.leading, 20)
            Spacer()
//            Text("11:37")
//                .foregroundColor(.white)
//                .font(.system(size: 20))
//                .padding(.trailing, 20)
            
        }
    }
}
