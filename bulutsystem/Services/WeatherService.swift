//
//  WeatherService.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import Foundation
import CoreLocation
// WeatherService.swift
class WeatherService {
    let api = "{YOURAPIKEY}units=metric"
    func getCurrentWather(latitude:CLLocationDegrees,longitude:CLLocationDegrees) async throws -> ResponseBody{
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(api)") else{
            fatalError("yükleniyor...")
        }
        
        let urlRequest = URLRequest(url:url)
       
        
        let (data,res) = try await URLSession.shared.data(for:urlRequest)
       
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("error fecting weather data")
        }
     
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
    }

   
}



//struct ResponseBody:Decodable,Equatable,Identifiable{
//    var id = Double()
//    
//    static func == (lhs: ResponseBody, rhs: ResponseBody) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//    var coord:CordinatreResponse
//    var weather:[WeatherResponse]
//    var main:MainResponse
//    var name:String
//    var wind:WindResponse
//   
//    
//
//    struct CordinatreResponse:Decodable{
//        var lon:Double
//        var lat:Double
//    }
//    
//    struct WeatherResponse:Decodable{
//        var id :Double
//        var main:String
//        var description:String
//        var icon:String
////        var weatherIconURL: URL {
////            let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
////            return URL(string: urlString)!
////        }
//       
//       
//    }
//    
//    struct MainResponse:Decodable{
//        var temp:Double
//        var feels_like:Double
//        var temp_min:Double
//        var temp_max:Double
//        var pressure:Double
//        var humidity:Double
//    }
//
//    struct WindResponse:Decodable{
//        var speed:Double
//        var deg:Double
//    }
//}

extension ResponseBody.MainResponse{
    var feelLike:Double{return feels_like}
    var tempMin:Double{return temp_min}
    var tempMax:Double{return temp_max}
}



