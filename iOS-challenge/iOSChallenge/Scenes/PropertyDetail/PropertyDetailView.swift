//
//  PropertyDetailView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct PropertyDetailView: View {
    
    @StateObject var viewModel = PropertyDetailViewModel()
    
    @State var property: Property
    @State private var showMap = false
    
    var onFavoriteToggle: ((Bool) -> Void)?
    
    init(property: Property) {
        self.property = property
    }
    
    var body: some View {
        
        VStack {
            cardInformation
            mapButton
        }.frame(maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showMap) {
                // TODO: Add Mapkit view
                mapView
            }
            .onAppear {
                viewModel.getPropertyDetail()
            }
        }
}

extension PropertyDetailView {
    
    // MARK: - View Builders
    
    @ViewBuilder
    var cardInformation: some View {
        
        VStack(alignment: .leading, spacing: .zero) {
            
            PropertyDetailImageCarousel(images: property.multimedia.images)
            
            cardContent
        }.background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .frame(height: 400)
            .padding(16)
    }
    
    @ViewBuilder
    var cardContent: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(property.address.capitalizedFirstLetter)
                    .font(.custom("Avenir", size: 25))
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image(systemName: "heart")
            }
            
            Label("\(property.propertyType.capitalizedFirstLetter) on \(property.operation)", systemImage: "house")
                .font(.custom("Avenir", size: 14))
                .foregroundColor(.gray)
            
            Label("\(property.district), \(property.province)", systemImage: "location")
                .font(.custom("Avenir", size: 14))
                .foregroundColor(.gray)
            
            Spacer().frame(height: 16)
            
            Text ("\(property.priceInfo.price.amount.formattedDouble)\(property.priceInfo.price.currencySuffix)")
                .font(.title3)
        }.padding(16)
    }
    
    @ViewBuilder
    var mapButton: some View {
        Button(action: {
            showMap = true
        }) {
            Text("Ver mapa")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
    }
    
    @ViewBuilder
    var mapView: some View {
        VStack {
            
            HStack {
                
                Text("Ubicación aproximada")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    showMap = false
                }) {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.black)
                }
            } .padding()
        }
        
        Spacer()
    }
}

#Preview {
    PropertyDetailView(property: Property(
        id: "12345",
        thumbnail: "https://example.com/thumbnail.jpg",
        floor: "2",
        price: 250000.0,
        priceInfo: PriceInfo(price: Price(amount: 2444.4, currencySuffix: "EUR")),
        propertyType: "Apartment",
        operation: "Sale",
        size: 80.0,
        exterior: true,
        rooms: 3,
        bathrooms: 2,
        address: "Rúa Río Bubal",
        province: "Barcelona",
        municipality: "Barcelona",
        district: "Barcelona",
        country: "Spain",
        neighborhood: "Gracia",
        latitude: 41.397738,
        longitude: 2.190471,
        description: "A beautiful apartment in the heart of the city.",
        multimedia: Multimedia(images: [ServerImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom"), ServerImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp", tag: "unknown"), ServerImage(url: "https://img4.idealista.com/blebp", tag: "unknown"),]),
        features: [
            "Swimming Pool": true,
            "Gym": false,
            "Balcony": true
        ]
    ))
}
