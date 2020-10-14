//
//  LocationSearchCellView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/7/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct LocationSearchCellView: View {
    let location: Location
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(location.title)
                    .font(.system(size: 17, weight: .semibold))
                Text(location.subtitle)
                    .foregroundColor(Color(.gray))
                    .font(.system(size: 12))
            }
            .padding()
            Spacer()
        }
    }
}

//struct LocationSearchCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationSearchCellView()
//    }
//}
