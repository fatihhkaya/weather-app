//
//  WeatherImage.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct WeatherImage: View {
    let weatherDescription: String

    var body: some View {
        let iconName = iconNameForWeatherDescription(weatherDescription)
        
        Image(systemName: iconName)
            .font(.system(size: 120))
            .symbolRenderingMode(.multicolor)
            .padding()
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
    
//        func translateWeatherCondition(_ condition: String) -> String {
//                switch condition.lowercased() {
//                    case "clouds": return "Bulutlu"
//                    case "clear": return "Açık"
//                    case "rain": return "Yağmurlu"
//                    // ... diğer hava durumu koşulları ...
//                    default: return "Bilinmiyor"
//                }
//            }
}
#Preview {
    WeatherImage(weatherDescription: "clouds")
}
