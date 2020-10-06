//
//  LineView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct LineView: View {
    let data: [Double]
    let bottomTitles: [String]
    var body: some View {
        GeometryReader { geometry in
            GeometryReader{ reader in
                Line(data: self.data,
                     bottomTitles: self.bottomTitles,
                     frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 20 , height: reader.frame(in: .local).height))
                )
                    .offset(x: 0, y: 0)
            }
            .frame(width: geometry.frame(in: .local).size.width, height: 160)
            .offset(x: 0, y: 0)
        }
    }
}
