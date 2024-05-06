//
//  WeatherResult.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct WeatherResult: View {
     var data: ResponseBody?
    
    var body: some View {
        VStack{
            
            Text("\(data!.name)")
                .font(.system(size: 26, weight: .light, design: .rounded))
            Text("\(data!.main.feelLike.roundDouble())°")
                .font(.system(size: 96, weight: .medium, design: .rounded))
            Text("\(data!.weather[0].main)")
                .font(.system(size: 24))
            WeatherImage(weatherDescription: data?.weather[0].description ?? "")
            Spacer()
            HStack(content: {
                
                
                RecView(icon: "thermometer.sun" , text: "En  Düşük Derece", value: data!.main.tempMin.roundDouble()+"°")
                
                RecView(icon: "thermometer.low" , text: "En Yüksek Derece", value: data!.main.tempMax.roundDouble()+"°")
                
                
                RecView(icon: "wind" , text: "Rüzgar Hızı", value: data!.wind.speed.roundDouble()+"m/s")
                
                RecView(icon: "humidity.fill" , text: "Nem Oranı", value: data!.main.humidity.roundDouble()+"%")
                
            })
            
            Spacer()
            
            
            
            
        }
    }
}
#Preview {
    WeatherResult(data: HomeViewModel().weather)
}
