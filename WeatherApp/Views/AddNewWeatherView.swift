//
//  AddNewWeatherView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/9/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct AddNewWeatherView: View {
    let weatherViewModel: WeatherViewModel
    let searchService: LocationSearchService
    @Binding var isPresented: Bool
    @Binding var didAdd: Bool
    @State var show = false
    
    var body: some View {
        ZStack {
            WeatherView(weatherViewModel: weatherViewModel, show: $show)
            VStack {
                HStack (alignment: .center) {
                    Button(
                        action: cancelButtTapped,
                        label: {
                            Text("Cancel")
                    })
                    Spacer()
                    Button(
                        action: addButtTapped,
                        label: {
                            Text("Add")
                    })
                }
                .padding(.all)
                .foregroundColor(Color.white)
                .font(.system(size: 18, weight: .semibold))
                
                Spacer()
            }
        }
        
    }
    private func addButtTapped() {
        searchService.addNewWeatherView(weatherView: weatherViewModel)
        didAdd.toggle()
        isPresented.toggle()
    }
    
    private func cancelButtTapped() {
        isPresented.toggle()
    }
    
}

