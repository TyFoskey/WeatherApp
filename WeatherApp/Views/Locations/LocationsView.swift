//
//  LocationsView.swift
//  WeatherApp
//
//  Created by ty foskey on 10/6/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct LocationsView: View {
    @Binding var isPresented: Bool
    @State private var isSearching = false
    @Binding var weatherViewModels: [WeatherViewModel]
    @State var showDelete = false
    var chunkedWeatherViews: [[WeatherViewModel]] {
        return chunked(size: 3)
    }
    @EnvironmentObject var networkManger: NetworkManager
    var searchService: LocationSearchService {
        return LocationSearchService(networkManager: networkManger)
    }
    
    init(isPresented: Binding<Bool>, weatherViewModels: Binding<[WeatherViewModel]>) {
        self._isPresented = isPresented
        self._weatherViewModels = weatherViewModels
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
        
        ZStack {
            VStack {
                HStack (alignment: .center){
                    Button(
                        action: addButtTapped,
                        label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(Color.blue)
                                .font(.system(size: 100, weight: .semibold))
                                .frame(width: 28, height: 28)
                    })
                    Spacer()
                    Text("Locations")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    Button(
                        action: cancelButtTapped,
                        label: {
                            Text("Done")
                    })
                }.padding(.horizontal)
                Text("Current")
                    .font(.system(size: 25, weight: .semibold))
                LocationCellView(weatherView: weatherViewModels.first!)
                Text("Recent")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 20)
                    .foregroundColor(Color(.black))
                List {
                    ForEach(0..<((chunkedWeatherViews.count == 1) ? 1 : chunkedWeatherViews.count), id: \.self) { index in
                        HStack (alignment: .center, spacing: 30) {
                            ForEach(self.chunkedWeatherViews[index], id: \.id) { viewModel in
                                RecentCellView(weatherView: viewModel, searchServie: self.searchService, showDelete: self.$showDelete)
                                    .animation(.easeInOut(duration: 0.25))
                                    .onTapGesture {
                                    self.recentTapped(viewModel: viewModel)
                                }
                                    .onLongPressGesture {
                                        self.showDelete.toggle()
                                }
                           }
                        }
                    }
                }.padding(EdgeInsets.init(top: 0, leading: 10, bottom: 0, trailing: 10))
               // Spacer()
            }
        }
        .sheet(isPresented: $isSearching, content: {
            SearchLocationView(isSearching: self.$isSearching, weatherViews: self.$weatherViewModels, networkManger: self.networkManger)
        })
        
    }
    
    private func cancelButtTapped() {
        isPresented.toggle()
    }
    
    private func addButtTapped() {
        isSearching.toggle()
    }
    
    private func delete(at offsets: IndexSet) {
        
    }
    
    private func recentTapped(viewModel: WeatherViewModel) {
        searchService.deleteWeatherView(weatherView: viewModel)
        searchService.addNewWeatherView(weatherView: viewModel)
    }
    
    private func chunked(size: Int) -> [[WeatherViewModel]] {
        var chunkedArray = [[WeatherViewModel]]()
        
        var rows = size % weatherViewModels.count
        if rows * size != weatherViewModels.count && weatherViewModels.count > size {
            rows += 1
        }
        
        if rows == 0 { rows = 1 }
       
        var index = 0

        for _ in 0..<rows {
            var rowSizeCount = 0
            var rowWeatherViews = [WeatherViewModel]()
            while rowSizeCount != size && index < weatherViewModels.count {
                rowWeatherViews.append(weatherViewModels[index])
                rowSizeCount += 1
                index += 1
            }
            chunkedArray.append(rowWeatherViews)
           // rowSizeCount = 0
        }
        
        return chunkedArray
    }
    

}
