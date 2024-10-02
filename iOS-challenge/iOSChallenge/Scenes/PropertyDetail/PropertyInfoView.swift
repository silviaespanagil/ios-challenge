//
//  PropertyInfoView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct PropertyInfoView: View {
    
    var size: Double
    var rooms: Int
    var bathrooms: Int

    var body: some View {
        
        VStack {
            
            HStack(spacing: .zero) {
                
                InfoSquare(icon: "house.fill", text: "\(rooms) hab.")
                
                Spacer()
                
                InfoSquare(icon: "ruler", text: "\(size) m²")
                
                Spacer()
                
                InfoSquare(icon: "bathtub", text: "\(bathrooms) baños")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .padding(.horizontal, 24)
        }
        .cardStyle()
    }
}


struct InfoSquare: View {
    
    var icon: String
    var text: String

    var body: some View {
        
        VStack {
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.secondary)
                .frame(width: 25, height: 25)
            
            Text(text)
                .multilineTextAlignment(.center)
                .font(.body)
        }
        .frame(height: 40)
    }
}

#Preview {
    PropertyInfoView(size: 241.0, rooms: 4, bathrooms: 2)
}
