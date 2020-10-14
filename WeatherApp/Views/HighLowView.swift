//
//  HighLowView.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct HighLowView: View {
    
    let fontSize: CGFloat
    let spacing: CGFloat
    let topDegreeText: String
    let bottomDegreeText: String
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            Text(topDegreeText)
                .padding(.leading, 4)
                .foregroundColor(Color(UIColor.white.withAlphaComponent(0.85)))
                //.foregroundColor(Color(#colorLiteral(red: 0.7601829171, green: 0.7531231642, blue: 0.824062705, alpha: 1)))
                
            Divider()
                .frame(height: 2.5)
                .background(Color(UIColor.white.withAlphaComponent(0.4)))
                .cornerRadius(2.5 / 2)
            
            Text(bottomDegreeText)
                .padding(.leading, 4)
                .foregroundColor(Color(UIColor.white.withAlphaComponent(0.4)))

        }
        
        .font(Font.system(size: fontSize, weight: .medium, design: .rounded))
    }
}

struct HighLowView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowView(fontSize: 30, spacing: 13, topDegreeText: "30° F", bottomDegreeText: "23° F")
    }
}
