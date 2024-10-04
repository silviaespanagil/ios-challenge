//
//  Mock+Property.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge

extension Property {
    
    static func mock(isFavorite: Bool = false) -> Property {
        
        return Property(
            id: "12345",
            thumbnail: "https://example.com/thumbnail.jpg",
            floor: "2",
            price: 250000.0,
            priceInfo: PriceInfo.mock(),
            propertyType: "Apartment",
            operation: "Sale",
            size: 80.0,
            exterior: true,
            rooms: 3,
            bathrooms: 2,
            address: "123 Main St",
            province: "Barcelona",
            municipality: "Barcelona",
            district: "Barcelona",
            country: "Spain",
            neighborhood: "Gracia",
            latitude: 41.397738,
            longitude: 2.190471,
            description: "A beautiful apartment in the heart of the city.",
            multimedia: Multimedia.mock(),
            features: [
                "Swimming Pool": true,
                "Gym": false,
                "Balcony": true
            ],
            isFavorite: isFavorite
        )
    }
}
