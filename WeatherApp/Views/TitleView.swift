//
//  TitleView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    let title: String
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(self.title)
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                    .font(.subheadline)
                Spacer()
               Divider()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .background(Color(UIColor.white.withAlphaComponent(0.15)))
                .padding(.trailing, 30)
                .padding(.top, 2)
                .padding(.leading, 12)
            }
        }.frame(maxHeight: 20)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "hey there")
    }
}
