//
//  FavLocationView.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct FavLocationAddView: View {
    @EnvironmentObject private var dataStore: DataStore
       var weatherData: ResponseBody?
       @ObservedObject var viewModel: FavoriteAddViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
           VStack {
               
               if let weather = weatherData {
                   HStack{
                      
                       
                       Button("Vazgeç") {
                           // Sheet'i kapat
                           dismiss()
                       }
                       .padding(15)
                       
                       Spacer()
                       
                       Button("Favoriye Ekle") {
                         
                           dataStore.addFavoriteLocation(weather)
                           print("ekleme ekranı \(dataStore.favoriteLocations.count)")
                               dismiss()
                            
                          
                       }
                       
                       .padding(15)
                   }
                   WeatherResult(data: weather)

                 
               } else {
                   // Hava durumu bilgisi yoksa
                   ProgressView()
               }
           }
          
       }
   }


