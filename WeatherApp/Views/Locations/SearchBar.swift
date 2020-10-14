//
//  SearchBar.swift
//  WeatherApp
//
//  Created by ty foskey on 10/7/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isCancelled: Bool
    @State private var isEditing = false
    
    var body: some View {
        VStack (spacing: 8){
            HStack {
                   
                   TextField("Search for a City", text: $text)
                       .padding(7)
                       .padding(.horizontal, 25)
                       .background(Color(.systemGray6))
                       .cornerRadius(8)
                       .overlay(
                           HStack {
                               Image(systemName: "magnifyingglass")
                                   .foregroundColor(.gray)
                                   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                   .padding(.leading, 8)
                        
                               if isEditing {
                                   Button(action: {
                                       self.text = ""
                                   }) {
                                       Image(systemName: "multiply.circle.fill")
                                           .foregroundColor(.gray)
                                           .padding(.trailing, 8)
                                   }
                               }
                           }
                       )
                       .padding(.horizontal, 10)
                       .animation(.easeInOut)
                       .onTapGesture {
                           self.isEditing = true
                   }
                   
                   
                       Button(action: {
                           self.isEditing = false
                           self.text = ""
                           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            self.isCancelled.toggle()
                       }) {
                           Text("Cancel")
                       }
                       .padding(.trailing, 10)
                       .transition(.move(edge: .trailing))
                       .animation(.easeInOut)
                   
               }
            Divider()
        }//.frame(height: 80)
    }
}

