//
//  PropertyDetailImageCarousel.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct PropertyDetailImageCarousel: View {
    
    var images: [ServerImage]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            TabView {
                
                ForEach(images, id: \.self) { image in
                    
                    AsyncImageView(urlString: image.url, height: 300)
                        .frame(width: geometry.size.width)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(maxHeight: .infinity)
            .padding(16)
        }
    }
}

#Preview {
    PropertyDetailImageCarousel(images: [ServerImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom"), ServerImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom"),ServerImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/326727.webp", tag: "livingRoom")])
}
