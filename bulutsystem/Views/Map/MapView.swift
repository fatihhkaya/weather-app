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
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.favorites) { favorite in
            MapAnnotation(coordinate: favorite.coordinate) {
                VStack {
                    Image(favorite.weatherIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("\(favorite.temperature)°C")
                        .font(.caption)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    MapView()
}
