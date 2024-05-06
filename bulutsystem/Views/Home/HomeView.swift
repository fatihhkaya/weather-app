//
//  HomeView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI

// MainView.swift

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @StateObject private var dataStore = DataStore()
    
    init() {
       fetchWeather()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
              
                if viewModel.isLoading {
                    EmptyWeatherView()
                      
                } else if viewModel.locationUpdated {
                
               
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(dataStore.favoriteLocations) { location in
                                    WeatherResult(data: location)
                                }
                            }
                        }
                    
                } else {
                    Text("Konum bilgisi alınamadı.")
                }
                
                NavigationLink {
                    MapView()
                   
                } label: {
                    HStack {
                        Image(systemName: "map") // İkon
                        Text("Haritada Göster") // Buton metni
                    }
                }
                .foregroundStyle(.blue)
                .padding()
                .background(.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
              
                              
                
                
                
                
            }
            .toolbar(content: {
                NavigationLink {
                    if viewModel.weather == nil {
                        ProgressView()
                    }else {
                        FavoriteLocView(data: viewModel.weather)
                    }
                   
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                .navigationTitle("")
            })

            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(
                LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            
        }
       
        
    }
  

    private func fetchWeather() {
          viewModel.locationManager.reqLocation()
          viewModel.fetchWeather()
      }
    
   
    
    //
}
extension Double{
    func roundDouble()->String{
        return String(format:"%.0f",self)
    }
}

#Preview {
   HomeView()
       
}

