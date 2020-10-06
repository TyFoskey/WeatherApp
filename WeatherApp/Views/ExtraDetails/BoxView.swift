//
//  BoxView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/1/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct BoxView: View {
    let imageName: String
    let titleText: String
    let subTitleText: String
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35, alignment: .center)
            Spacer(minLength: 8)
            Text(titleText)
                .font(Font.system(size: 15, weight: .regular, design: .rounded))

            Text(subTitleText)
                .padding(.bottom, 8)
                .font(Font.system(size: 20, weight: .bold, design: .rounded))
        }
        .foregroundColor(Color.white)
        .frame(width: 115, height: 115)
        .background(Color(UIColor.white.withAlphaComponent(0.2)))
        .cornerRadius(10)
    }
}

//struct BoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxView()
//    }
//}
