//
//  ContentView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI

struct ContentView: View {
      @StateObject private var dataStore = DataStore()
      @StateObject private var locationManager = LocationManager()

      var body: some View {
          HomeView(dataStore: dataStore, locationManager: locationManager)
      }
  }

#Preview {
    ContentView()
}
