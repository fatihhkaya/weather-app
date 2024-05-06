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
    @State private var cameraPosition: MapCameraPosition = .automatic
    var destination: Destination
    
    var body: some View {
        Map(position:$camPosition, selection: $favLocation) {
            ForEach (listFavLocation) { loc in
                Group{
                    if loc.destination =! nil {
                        Marker(coordinate: loc.coordinate) {
                            Label(loc.name), systemImage: "star")
                            
                        }
                        
                    }else {
                        Marker(loc.name,coordinate: loc.coordinate)
                    }
                }
                
            }
        }
      
    }
}


