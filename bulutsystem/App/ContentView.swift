//
//  ContentView.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI

struct ContentView: View {
     
    @StateObject private var dataStore = DataStore()

      var body: some View {
          HomeView()
              .onAppear {
                          dataStore.objectWillChange.send()
                      }
      }
  }

#Preview {
    ContentView()
}
