//
//  FavoriteViewModel.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation
import CoreLocation

// FavoriteAddViewModel.swift
class FavoriteAddViewModel: ObservableObject {
   

    @Published var selectedLocationWeather: ResponseBody?
    @Published var isPresentingSheet = false
    @Published var isLoading: Bool = false
    @Published var favoriteLocations: [ResponseBody] = []
    
    private let dataStore = DataStore()
  
  
    
    init() {
        dataStore.loadFavoriteLocations()
      }


   
     
 
   //girilen konumun değerlerini çeker 
    func getWeatherForLocation(query: String) {
         isLoading = true
        CLGeocoder().geocodeAddressString(query) { [self] placemarks, error in
             if let error = error {
                 print("Hata: \(error.localizedDescription)")
                 self.isLoading = false
                 return
             }

             guard let placemark = placemarks?.first, let location = placemark.location else {
                 print("Konum bulunamadı")
                 self.isLoading = false
                 return
             }

             Task {
                 do {
                     let weatherData = try await WeatherService().getCurrentWather(
                         latitude: location.coordinate.latitude,
                         longitude: location.coordinate.longitude
                     )
                     DispatchQueue.main.async {
                         self.selectedLocationWeather = weatherData
                         self.isPresentingSheet = true
                         self.isLoading = false
                     }
                   dataStore.addFavoriteLocation(weatherData)
                 } catch {
                     print("Hava durumu bilgisi alınamadı: \(error)")
                     self.isLoading = false
                 }
             }
         }
     }
}



