//
//  bulutsystemApp.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI
import CoreLocation

@main
struct bulutsystemApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                
        }
    }
}
//
//class AppDelegate: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let locationManager = CLLocationManager()
//        var currentLocation: CLLocation?
//        
//        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//            if status == .authorizedWhenInUse {
//                locationManager.requestLocation()
//            }
//        }
//        
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            if let location = locations.last {
//                currentLocation = location
//                
//                // Konumdan hava durumu verilerini al
//                Task {
//                    if let weatherData = try? await WeatherService().getCurrentWather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) {
//                        let dataStore = DataStore.shared
//                        dataStore.addFavoriteLocation(weatherData)
//                    }
//                }
//            }
//        }
//        
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        
//        return true
//    }
//  
//}

