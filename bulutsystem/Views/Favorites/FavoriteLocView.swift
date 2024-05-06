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
    @StateObject private var viewModel = FavoriteAddViewModel()
     var data: ResponseBody?
    @StateObject  private var dataStore = DataStore()
    
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
        .navigationTitle("Hava Durumu")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .sheet(isPresented: $viewModel.isPresentingSheet) {
                   if let weatherData = viewModel.selectedLocationWeather {
                       FavLocationView(weatherData: weatherData, viewModel: self.viewModel)
                   }
               }
    }
}

