//
//  FavoriteAddView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI
import CoreLocation

// FavoriteAddView.swift
struct FavoriteLocView: View {
    @EnvironmentObject private var dataStore: DataStore
    @StateObject private var viewModel = FavoriteAddViewModel()
//     var data: ResponseBody?
  
    var body: some View {
        VStack {
            
            SearchBar(viewModel: viewModel)

          Spacer()
                .frame(height: 10)
 
            ScrollView {
                ForEach(dataStore.favoriteLocations) { location in
                  
                               FavoriteCell(status: location.weather[0].main, feelLike: location.main.feelLike.roundDouble(), tempMax: location.main.tempMax.roundDouble(), tempMin: location.main.tempMin.roundDouble(), cityName: location.name)
                           }
            }
           
            Spacer()

        }
        .onDisappear(perform: {
            print("favori ekranı \(dataStore.favoriteLocations.count)")
        })
        .navigationTitle("Hava Durumu")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .sheet(isPresented: $viewModel.isPresentingSheet) {
                   if let weatherData = viewModel.selectedLocationWeather {
                       FavLocationAddView(weatherData: weatherData, viewModel: self.viewModel)
                   }
               }
    }
}

