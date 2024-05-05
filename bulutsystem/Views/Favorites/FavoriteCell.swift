//
//  FavoriteCell.swift
//  bulutsystem
//
//  Created by Fatih on 3.05.2024.
//

import SwiftUI

import SwiftUI

struct FavoriteCell: View {
    let favorite: Favorite
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .foregroundColor(.blue)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(favorite.name)
                    .font(.headline)
                
                Text("\(favorite.latitude), \(favorite.longitude)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    FavoriteCell(favorite: Favorite(id: "1", name: "San Francisco", latitude: 37.7749, longitude: -122.4194))
}

