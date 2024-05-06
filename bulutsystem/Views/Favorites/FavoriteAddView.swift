//
//  FavoriteAddView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI
import CoreLocation

// FavoriteAddView.swift
struct FavoriteAddView: View {
    @StateObject private var viewModel = FavoriteAddViewModel()
     var data: ResponseBody?
    private let dataStore = DataStore()
    
    var body: some View {
        VStack {
            
            SearchBar(viewModel: viewModel)
           
            
          Spacer()
                .frame(height: 10)
        
            FavoriteCell(status: data!.weather[0].main, feelLike: data!.main.feelLike.roundDouble(), tempMax: data!.main.tempMax.roundDouble(), tempMin: data!.main.tempMin.roundDouble(), cityName: data!.name)
            Spacer()
                .frame(height: 10)
            
            ScrollView {
                ForEach(dataStore.favoriteLocations) { location in
                  
                               FavoriteCell(status: location.weather[0].main, feelLike: location.main.feelLike.roundDouble(), tempMax: location.main.tempMax.roundDouble(), tempMin: location.main.tempMin.roundDouble(), cityName: location.name)
                           }
            }
           
            Spacer()
        
       
//            List {
//                ForEach($viewModel.favoriteLocations,id: \.id) { $location in
//                    FavoriteLocationView(location: data!)
//                }
//            }
                   
        
                  
       
           
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

//struct FavoriteLocationView: View {
//    let location: ResponseBody
//    
//    var body: some View {
//     
//            HStack {
//                VStack(alignment: .leading) {
//                    
//                    Text(location.name)
//                        .font(.system(size: 26, weight: .light, design: .rounded))
//                    
//                    Spacer()
//                    
//                    Text(location.weather[0].main)
//                        .font(.system(size: 14))
//                    
//                    
//                }
//                .padding(15)
//                Spacer()
//                VStack {
//                    
//                    Text("\(location.main.feelLike.roundDouble())°")
//                        .font(.system(size: 70, weight: .medium, design: .rounded))
//                        
//                    Spacer()
//                    HStack {
//                        Text("Y:\(location.main.tempMax.roundDouble())°")
//                        Text("D:\(location.main.tempMin.roundDouble())°")
//                        
//                        
//                    }
//                    
//                }
//                .padding(15)
//                
//                
//                
//            }
//            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .bottomLeading, endPoint: .trailing))
//            .clipShape(RoundedRectangle(cornerRadius: 7))
//            .padding(10)
//        }
//    
//}
