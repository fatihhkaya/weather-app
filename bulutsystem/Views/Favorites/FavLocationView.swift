//
//  FavLocationView.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct FavLocationView: View {
    var weatherData: ResponseBody?
    @ObservedObject var viewModel: FavoriteAddViewModel
    private let dataStore = DataStore()
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


