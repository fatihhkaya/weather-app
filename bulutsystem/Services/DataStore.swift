//
//  DataStore.swift
//  bulutsystem
//
//  Created by Fatih on 6.05.2024.
//

import Foundation
import CoreLocation
import MapKit

class DataStore: ObservableObject {
    @Published var favoriteLocations: [ResponseBody] = []

    
    init() {
        loadFavoriteLocations()
    }
    
//    func loadFavoriteLocations() {
//        if FileManager.default.fileExists(atPath: FileManager.storageURL.path) {
//            do {
//                let data = try Data(contentsOf: FileManager.storageURL)//                favoriteLocations = try JSONDecoder().decode([ResponseBody].self, from: data)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
    func loadFavoriteLocations() {
        if FileManager.default.fileExists(atPath: FileManager.storageURL.path) {
            do {
                let data = try Data(contentsOf: FileManager.storageURL)
                favoriteLocations = try JSONDecoder().decode([ResponseBody].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func saveFavoriteLocations() {
        do {
            let data = try JSONEncoder().encode(favoriteLocations)
            let jsonString = String(decoding: data, as: UTF8.self)
            try jsonString.write(to: FileManager.storageURL, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
    

    
//    func addFavoriteLocation(_ location: ResponseBody) {
//        DispatchQueue.global().async {
//            // DataStore işlemleri
//           
//         
//            self.favoriteLocations.append(location)
//            self.saveFavoriteLocations()
////            self.objectWillChange.send()
//            DispatchQueue.main.async {
//                // UI güncellemeleri
//                self.objectWillChange.send()
//            }
//        }
//    }
    
    func addFavoriteLocation(_ location: ResponseBody) {
        objectWillChange.send()
        favoriteLocations.append(location)
        saveFavoriteLocations()
    }
  
//    func removeFavoriteLocation(_ location: ResponseBody) {
//        if let index = favoriteLocations.firstIndex(where: { $0.id == location.id }) {
//            favoriteLocations.remove(at: index)
//            saveFavoriteLocations()
//        }
//    }
}

extension FileManager {
    static var fileName = "Cities.json"
    static var storageURL = URL.documentsDirectory.appendingPathComponent(fileName, conformingTo: .json)
}
