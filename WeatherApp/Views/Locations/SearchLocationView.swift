//
//  SearchLocationView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/7/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct SearchLocationView: View {
    @ObservedObject var searchService: LocationSearchService
    @Binding var isSearching: Bool
    @Binding var weatherViews: [WeatherViewModel]
    @ObservedObject private var keyboardObserver = KeyboardObserver()
    @State var newWeatherView: WeatherViewModel?
    @State var presentNewWeatherView = false
    @State var didAdd = false
    
    init(isSearching: Binding<Bool>, weatherViews: Binding<[WeatherViewModel]>, networkManger: NetworkManager) {
        self._isSearching = isSearching
        self._weatherViews = weatherViews
        self.searchService = LocationSearchService(networkManager: networkManger)
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            Text("Enter City")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 12)
            SearchBar(text: $searchService.searchQuery, isCancelled: $isSearching)
            // .padding(.top, 4)
            
            List(searchService.completions) { location in
                VStack (alignment: .center) {
                    LocationSearchCellView(location: location)
                        .frame(height: 50)
                        .onTapGesture {
                            self.searchService.requestItem(location: location) { (newWeatherView) in
                                self.newWeatherView = newWeatherView
                                self.presentNewWeatherView.toggle()
                            }
                            // self.locations.append(location)
                    }
                }
            }
            .padding(.bottom, keyboardObserver.keyboardHeight)
            .animation(.easeInOut(duration: keyboardObserver.keyboardHeight == 0 || searchService.searchQuery.isEmpty == false ? 0 : 0.25))
        }.sheet(isPresented: $presentNewWeatherView, onDismiss: {
            if self.didAdd == true {
                self.isSearching.toggle()
            }
        }, content: {
            AddNewWeatherView(weatherViewModel: self.newWeatherView!, searchService: self.searchService, isPresented: self.$presentNewWeatherView, didAdd: self.$didAdd)
            
        })
        
    }
    
    private func backTapped() {
        isSearching.toggle()
    }
}

