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
    @StateObject private var dataStore = DataStore()
    
    var body: some Scene {
        WindowGroup {
         
                           HomeView()
                               .environmentObject(dataStore)
                     
                
        }
    }
}


