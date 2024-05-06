//
//  SearchBar.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: FavoriteAddViewModel
    @State private var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .onTapGesture {
                                    viewModel.getWeatherForLocation(query: searchText)
                                }
            TextField("Şehir veya bölge ara", text: $searchText, onCommit: {
                viewModel.getWeatherForLocation(query: searchText)
            })
            .foregroundColor(.white)
            .padding(.leading, 10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
        )
    }
}
