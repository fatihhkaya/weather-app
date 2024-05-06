//
//  MapViewModel.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation
import CoreLocation
import MapKit
// MapViewModel.swift
class MapViewModel: ObservableObject {
  
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @Published var favorites: [FavoriteAnnotation] = []
    
    init() {
        fetchFavorites()
    }
    
    private func fetchFavorites() {
        // Favori şehirleri al (UserDefaults veya Core Data'dan)
        // FavoriteAnnotation modellerini oluştur
    }
}

struct FavoriteAnnotation: Identifiable {
    let id: String
    let coordinate: CLLocationCoordinate2D
    let weatherIcon: String
    let temperature: Double
}
