//
//  AsyncImageView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct AsyncImageView: View {
    
    let urlString: String
    let height: CGFloat
    
    var body: some View {
        
        AsyncImage(url: URL(string: urlString)) { phase in
            
            switch phase {
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
            case .failure, .empty:
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
            @unknown default:
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    
    VStack {
        
        AsyncImageView(urlString: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/f4/0d/ce/1271132815.webp", height: 300).padding(.bottom, 70)
        
        AsyncImageView(urlString: "https://img4.idealista.comwebp", height: 200)
    }
}
