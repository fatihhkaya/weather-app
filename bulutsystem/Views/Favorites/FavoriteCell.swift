//
//  FavoriteCell.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI


struct FavoriteCell: View {
    var status: String
    var feelLike: String
    var tempMax: String
    var tempMin: String
    var cityName: String
    
    var body: some View {
     
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(cityName)
                        .font(.system(size: 26, weight: .light, design: .rounded))
                    Text("")
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text(status)
                        .font(.system(size: 14))
                    
                    
                }
                .padding(15)
                Spacer()
                VStack {
                    
                    Text("\(feelLike)°")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("Y:\(tempMax)")
                        Text("D:\(tempMin)")
                        
                        
                    }
                    
                }
                .padding(15)
                
                
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .bottomLeading, endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: 7))
        
        }
    
}

#Preview {
    FavoriteCell(status: "Bulutlu", feelLike: "22", tempMax: "22", tempMin: "24",cityName: "adsf")
}

