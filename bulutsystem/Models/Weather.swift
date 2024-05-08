//
//  Weather.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation
import CoreLocation

struct ResponseBody: Codable, Identifiable {
    let id: Int
    let coord: CordinatreResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let name: String
    let wind: WindResponse

    struct CordinatreResponse: Codable {
        let lon: Double?
        let lat: Double?
    }
    var coordinate: CLLocationCoordinate2D {
        guard let latitude = coord.lat, let longitude = coord.lon else {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    struct WeatherResponse: Codable {
        let id: Double
        let main: String
        let description: String
        let icon: String
    }

    struct MainResponse: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }

    struct WindResponse: Codable {
        let speed: Double
        let deg: Double
    }
}
