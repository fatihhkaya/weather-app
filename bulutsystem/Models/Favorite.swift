//
//  Favorite.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation


struct Favorite: Identifiable, Codable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    // Diğer özellikleri buraya ekleyebilirsiniz (ikon, sıcaklık vb.)

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case latitude
        case longitude
    }
}
