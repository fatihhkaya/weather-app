//
//  HomeViewModel.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation
import CoreLocation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var cityName = ""
    @Published var weatherIcon = ""
    @Published var weather: ResponseBody?
    @Published var isLoading = true
    @Published var locationUpdated = false
    @Published var locationAvailable = false

    let locationManager = LocationManager()
     let weatherService = WeatherService()
     var lastLocation: CLLocationCoordinate2D?
   
    init() {
       
        locationManager.reqLocation()
        setupLocationObserver()
        fetchWeather()
    }

    private func setupLocationObserver() {
        locationManager.$location
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                guard let self = self else { return }
                self.lastLocation = location
                self.locationAvailable = location != nil
                self.fetchWeather()
            }
            .store(in: &cancelBag)
    }
    
  
    
    func fetchWeather() {
        guard locationAvailable else {
            return
        }

        Task {
            do {
                guard let location = lastLocation else {
                    return
                }
                let weather = try await weatherService.getCurrentWather(latitude: location.latitude, longitude: location.longitude)
            
                DispatchQueue.main.async {
                    
                    self.cityName = weather.name
                    self.weatherIcon = weather.weather.first?.icon ?? ""
                    self.isLoading = false
                    self.locationUpdated = true
                    self.weather = weather
                   
                }
              
            } catch {
                print("Hava durumu verisi alınamadı: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
//    func updateWeatherIcon(condition: String) {
//        // condition değerine göre uygun ikon adını ayarlayın
//     
//        switch condition {
//        case "Clouds": weatherIcon = "cloud.fill"
//        case "Clear": weatherIcon = "sun.max.fill"
//        case "Rain": weatherIcon = "cloud.rain.fill"
//        // ... diğer durumlar için ikonlar ...
//        default: weatherIcon = "questionmark" // Bilinmeyen durum
//        }
//    }
    
    private var cancelBag = Set<AnyCancellable>()
}
