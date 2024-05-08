//
//  MapView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI
import MapKit
// MapView.swift


struct MapView: View {
    @ObservedObject var dataStore: DataStore
    @State private var cameraPosition: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(dataStore.favoriteLocations) { location in
                Annotation(location.main.feelLike.roundDouble(), coordinate: location.coordinate) {
                    Circle()
                            .fill(Color.accentColor)
                            .frame(width: 50, height:50)
                            .overlay {
                               
                                    Image(systemName:iconNameForWeatherDescription(location.weather[0].description) )
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .foregroundStyle(.white)
                                      .frame(width: 30, height: 30, alignment: .center)
                                
                            
                            }
                }
//                Marker(coordinate: location.coordinate) {
//                   
//                    Label(location.main.feelLike.roundDouble(), systemImage: iconNameForWeatherDescription(location.weather[0].description))
//                      
//                }
//                .tint(.blue)
//                .annotationTitles(.visible)
//                .mapOverlayLevel(level: .aboveLabels)
               
            }
        }
    }
    func iconNameForWeatherDescription(_ description: String) -> String {
        switch description.lowercased() {
        case "few clouds": return "cloud.sun"
        case "scattered clouds": return "cloud"
        case "broken clouds": return "smoke"
        case "overcast clouds": return "cloud.fill"
        case "clear sky": return "sun.max.fill"
        case "light rain": return "cloud.sun.rain"
        case "moderate rain": return "cloud.rain"
        // ... diğer hava koşulları ve ikon eşleşmeleri ...
        default: return "questionmark"
        }
    }
}

