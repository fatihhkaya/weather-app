//
//  CardView.swift
//  bulutsystem
//
//  Created by Fatih on 5.05.2024.
//

import SwiftUI

struct RecView:View{
    var icon:String
    var text:String
    var value:String
    
    var body: some View{
        VStack(spacing:10){
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 60,height: 60)
                .background(.white.opacity(0.6))
                .foregroundStyle(.black)
                .cornerRadius(12)
                .padding(.top)
            
            Text(text)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .frame(width: 70,height: 40)
            
            
            
            Text("\(value)")
                .font(.system(size: 22,weight: .bold))
                .padding(.bottom,20)
            
        }
        
        .frame(width:85,height: 160)
        .foregroundStyle(.white)
        .background(.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal,2)
    }
}

#Preview {
    RecView(icon: "sun.min.fill", text: "Rüzgar ", value: "10 km/S")
}
