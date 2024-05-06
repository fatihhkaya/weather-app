//
//  EmptyWeatherView.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct EmptyWeatherView: View {
    
    var body: some View {
        VStack{
            
            Text("Yükleniyor")
                .font(.system(size: 26, weight: .light, design: .rounded))
            
            Text("--")
                .font(.system(size: 96, weight: .medium, design: .rounded))
            
            Image(systemName: "sun.haze.fill")
                .font(.system(size: 100))
            
            
            Spacer()
            HStack(content: {
                
                RecView(icon: "thermometer.sun" , text: "En Düşük ", value: "--")
                    .blinking(duration: 1)
                
                RecView(icon: "thermometer.sun" , text: "En Yüksek", value: "--")
                    .blinking(duration: 0.9)
                
                RecView(icon: "thermometer.sun" , text: "Rüzgar Hızı", value: "--")
                    .blinking(duration: 0.8)
                
                
                RecView(icon: "thermometer.sun" , text: "Nem Oranı", value: "--")
                    .blinking(duration: 0.7)
                
            })
            
            Spacer()
            
            
            
            
        }
        
    }
}

#Preview {
    EmptyWeatherView()
}
