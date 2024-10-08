//
//  PropertyDetailView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct PropertyDetailView: View {
    
    @StateObject var viewModel: PropertyDetailViewModel
    
    @State var property: Property
    @State private var showMap = false
    @State private var isExpanded: Bool = false
    
    init(property: Property) {
        self.property = property
        self._viewModel = StateObject(wrappedValue: PropertyDetailViewModel(property: property))
    }
    
    var body: some View {
        
        VStack(spacing: .zero) {
            
            ScrollView {
                
                propertyInformation
                
                Spacer().frame(height: 16)
                
                detailContent
            }
        }.frame(maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showMap) {
                mapView
            }
            .onAppear {
                viewModel.getPropertyDetail()
            }
    }
    
    // MARK: - Detail State views
    
    @ViewBuilder
    var detailContent: some View {
        
        switch viewModel.detailState {
            
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .loaded:
            loadedView
        }
    }
    
    @ViewBuilder
    var loadedView: some View {
        
        VStack {
            
            ScrollView {
                
                Divider()
                
                ExpandableTextView(text: viewModel.propertyDetail!.propertyComment)
                    .padding(.horizontal)
                
                Divider()
            }
            
            additionalCharacteristics
        }
    }}

// MARK: - View Builders

extension PropertyDetailView {
    
    @ViewBuilder
    var propertyInformation: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: .zero) {
                
                PropertyDetailImageCarousel(images: property.multimedia.images)
                
                cardContent
                
            }.frame(height: 400)
                .cardStyle()
            
            Spacer().frame(height: 16)
            
            PropertyInfoView(size: property.size, rooms: property.rooms, bathrooms: property.bathrooms).cardStyle()
        }.padding(.horizontal)
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
                
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    
                    Image(systemName: viewModel.favorite.isFavorite ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }
            
            Label(viewModel.localization.propertyTypeAndOperation(property.propertyType, operation: property.operation), systemImage: "house")
                .font(.custom("Avenir", size: 14))
                .foregroundColor(.gray)
            
            Label(viewModel.localization.neighborhoodAndMunicipality(property.neighborhood, municipality: property.municipality), systemImage: "location")
                .font(.custom("Avenir", size: 14))
                .foregroundColor(.gray)
            
            if viewModel.favorite.isFavorite {
                
                Text(viewModel.localization.favoriteSinceDate(viewModel.favorite.dateAdded))
                    .font(.footnote)
                    .padding(8)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.green)
            }
            
            Spacer().frame(height: 16)
            
            HStack {
                
                Text (viewModel.localization.formattedPrice(property.priceInfo.price.amount.formattedDouble,
                                                            currency: property.priceInfo.price.currencySuffix))
                .font(.title3)
                
                Spacer()
                
                Button(action: {
                    showMap = true
                }) {
                    
                    HStack {
                        Text(viewModel.localization.viewMapButton)
                            .font(.body)
                            .foregroundColor(.green)
                        Image(systemName: "map")
                            .foregroundColor(.green)
                    }
                }
            }
        }.padding(16)
    }
    
    @ViewBuilder
    var mapView: some View {
        
        VStack {
            
            HStack {
                
                Text(viewModel.localization.approximateLocation)
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
        
        MapView(latitude: property.latitude, longitude: property.longitude)
    }
    
    @ViewBuilder
    
    var additionalCharacteristics: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(viewModel.localization.additionalCharacteristics)
                .font(.title3)
                .padding(.vertical, 8)
            
            if let characteristics = viewModel.propertyDetail?.moreCharacteristics {
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(viewModel.additionalCharacteristicsList(characteristics), id: \.text) { characteristic in
                        Label(characteristic.text, systemImage: characteristic.image)
                            .font(.body)
                    }
                }
            }
        }
        .padding(.horizontal)
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
        multimedia: Multimedia(images: [PropertyImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom"), PropertyImage(url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp", tag: "unknown"), PropertyImage(url: "https://img4.idealista.com/blebp", tag: "unknown"),]),
        features: [
            "Swimming Pool": true,
            "Gym": false,
            "Balcony": true
        ]
    ))
}
